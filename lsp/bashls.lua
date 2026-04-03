local lsp = require "user.lsp"

return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_markers = { ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
}
