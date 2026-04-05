local lsp = require "user.lsp"

return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
  init_options = {
    settings = {
      organizeImports = true,
      fixAll = true,
    },
  },
}
