local lsp = require "user.lsp"

return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
}
