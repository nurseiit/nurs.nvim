local lsp = require "user.lsp"

return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
  root_markers = { "package.json", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
}
