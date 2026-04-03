local lsp = require "user.lsp"

return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
  settings = {
    ["rust-analyzer"] = {},
  },
}
