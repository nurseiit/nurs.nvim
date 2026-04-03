local lsp = require "user.lsp"

return {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
}
