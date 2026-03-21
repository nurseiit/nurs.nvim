local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/lazydev.nvim",
  },
}

-- Helper: ensure a result is a list of Location or LocationLink
local function as_locations(res)
  if not res then
    return {}
  elseif vim.islist(res) then
    return res
  else
    return { res }
  end
end

-- Your custom “go to definition”:
function M.go_to_definition_prefer_cssmodules()
  local params = vim.lsp.util.make_position_params(0, "utf-8")
  vim.lsp.buf_request_all(0, "textDocument/definition", params, function(responses)
    local css_locs = {}
    local fallback_locs = {}

    for client_id, resp in pairs(responses) do
      if resp.result then
        local client = vim.lsp.get_client_by_id(client_id)
        local locs = as_locations(resp.result)

        if client ~= nil and client.name == "cssmodules_ls" then
          vim.list_extend(css_locs, locs)
        else
          vim.list_extend(fallback_locs, locs)
        end
      end
    end

    local to_jump = (#css_locs > 0) and css_locs or fallback_locs
    if vim.tbl_isempty(to_jump) then
      vim.notify("No definition found", vim.log.levels.INFO)
      return
    end

    if #to_jump == 1 then
      -- single result
      vim.lsp.util.show_document(to_jump[1], "utf-8", { focus = true })
    else
      -- multiple: opens quickfix list
      vim.lsp.util.show_document(to_jump[1], "utf-8", { focus = true })
    end
  end)
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua require('user.lspconfig').go_to_definition_prefer_cssmodules()<CR>", opts)
  keymap(bufnr, "n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client:supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function M.common_capabilities()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = false
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, {
    bufnr,
  })
end

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    { "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  }

  wk.add {
    {
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<cr>",
      name = "LSP",
      desc = "Code Action",
      mode = "v",
    },
  }

  local icons = require "user.icons"

  local servers = {
    "lua_ls",
    "cssls",
    "cssmodules_ls",
    "css_variables",
    "typescript-tools",
    "html",
    "eslint",
    "bashls",
    "jsonls",
    "yamlls",
    "stylelint_lsp",
    "pyright",
    "ruff",
    -- "astro",
    -- "postgres_lsp",
    "rust_analyzer",
    "oxlint",
  }

  local default_diagnostic_config = {
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      ---@diagnostic disable-next-line: missing-fields
      require("lazydev").setup {}
    end

    if server == "typescript-tools" then
      require("typescript-tools").setup {}
    end

    vim.lsp.enable(server)
    vim.lsp.config(server, opts)
  end
end

return M
