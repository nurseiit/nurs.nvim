local lsp = require "user.lsp"

return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      format = { enable = false },
    },
  },
}
