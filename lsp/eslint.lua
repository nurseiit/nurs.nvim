local lsp = require "user.lsp"

return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs", "eslint.config.ts", "eslint.config.mts", "eslint.config.cts" },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities(),
  settings = {
    validate = "on",
    codeActionOnSave = { mode = "all" },
    format = { enable = false },
    workingDirectories = { mode = "auto" },
  },
}
