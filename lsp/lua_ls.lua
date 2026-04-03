local lsp = require "user.lsp"

return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
  settings = {
    Lua = {
      format = { enable = false },
      diagnostics = { globals = { "vim", "spec" } },
      runtime = {
        version = "LuaJIT",
        special = { spec = "require" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      hint = {
        enable = false,
        arrayIndex = "Disable",
        await = true,
        paramName = "Disable",
        paramType = true,
        semicolon = "All",
        setType = false,
      },
      telemetry = { enable = false },
    },
  },
}
