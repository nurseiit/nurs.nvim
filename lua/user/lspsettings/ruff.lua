return {
  on_attach = function(client, bufnr)
    require("user.lspconfig").on_attach(client, bufnr)
    -- Disable hover in favor of pyright
    client.server_capabilities.hoverProvider = false
  end,
  init_options = {
    settings = {
      organizeImports = true,
      fixAll = true,
    },
  },
}
