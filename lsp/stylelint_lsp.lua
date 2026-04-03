local lsp = require "user.lsp"

return {
  cmd = { "stylelint-lsp", "--stdio" },
  filetypes = { "css", "less", "scss" },
  root_markers = { ".stylelintrc", ".stylelintrc.json", ".stylelintrc.js", ".stylelintrc.yml", "stylelint.config.js", "stylelint.config.cjs", ".git" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
    },
  },
}
