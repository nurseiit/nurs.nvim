local M = {}

local function as_locations(res)
  if not res then
    return {}
  elseif vim.islist(res) then
    return res
  else
    return { res }
  end
end

function M.go_to_definition_prefer_cssmodules()
  local params = vim.lsp.util.make_position_params(0, "utf-8")
  vim.lsp.buf_request_all(0, "textDocument/definition", params, function(responses)
    local css_locs = {}
    local fallback_locs = {}

    for client_id, resp in pairs(responses) do
      if resp.result then
        local client = vim.lsp.get_clients({ id = client_id })[1]
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

    vim.lsp.util.show_document(to_jump[1], "utf-8", { focus = true })
    if #to_jump > 1 then
      vim.fn.setqflist(vim.lsp.util.locations_to_items(to_jump, "utf-8"))
      vim.cmd "copen"
    end
  end)
end

local css_module_filetypes = {
  javascript = true,
  javascriptreact = true,
  typescript = true,
  typescriptreact = true,
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

  local ft = vim.bo[bufnr].filetype
  if css_module_filetypes[ft] then
    vim.keymap.set("n", "gd", M.go_to_definition_prefer_cssmodules, opts)
  else
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  end
end

function M.on_attach(client, bufnr)
  lsp_keymaps(bufnr)

  if client:supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function M.capabilities()
  local capabilities = require("blink.cmp").get_lsp_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = false
  return capabilities
end

function M.toggle_inlay_hints()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, {
    bufnr,
  })
end

return M
