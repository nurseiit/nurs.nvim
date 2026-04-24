local M = {}

function M.setup()
  local lsp = require "user.lsp"
  local wk = require "which-key"
  local icons = require "user.icons"

  wk.add {
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    {
      "<leader>lf",
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      desc = "Format",
    },
    { "<leader>li", "<cmd>checkhealth vim.lsp<cr>", desc = "Info" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.jump({count=1})<cr>", desc = "Next Diagnostic" },
    { "<leader>lh", "<cmd>lua require('user.lsp').toggle_inlay_hints()<cr>", desc = "Hints" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.jump({count=-1})<cr>", desc = "Prev Diagnostic" },
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

  vim.diagnostic.config {
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
      source = true,
      header = "",
      prefix = "",
    },
  }

  vim.lsp.config("*", {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities(),
  })

  vim.lsp.enable {
    "bashls",
    "css_variables",
    "cssls",
    "cssmodules_ls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "oxlint",
    "pyright",
    "ocamllsp",
    "ruff",
    "rust_analyzer",
    "stylelint_lsp",
    "yamlls",
  }
end

return M
