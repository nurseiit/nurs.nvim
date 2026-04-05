return {
  cmd = { "stylelint-lsp", "--stdio" },
  filetypes = { "css", "less", "scss" },
  root_markers = {
    ".stylelintrc",
    ".stylelintrc.json",
    ".stylelintrc.js",
    ".stylelintrc.yml",
    "stylelint.config.js",
    "stylelint.config.cjs",
    ".git",
  },
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
    },
  },
}
