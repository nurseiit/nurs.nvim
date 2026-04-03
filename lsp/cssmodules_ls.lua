local lsp = require "user.lsp"

return {
  cmd = { "cssmodules-language-server" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
}
