local lsp = require "user.lsp"

return {
  cmd = { "oxc_language_server" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { ".oxlintrc.json", "package.json", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
}
