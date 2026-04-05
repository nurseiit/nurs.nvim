local M = {
  "mason-org/mason.nvim",
}

function M.config()
  require("mason").setup {
    ui = {
      border = "rounded",
    },
    ensure_installed = {
      "lua-language-server",
      "css-lsp",
      "css-variables-language-server",
      "cssmodules-language-server",
      "html-lsp",
      "bash-language-server",
      "json-lsp",
      "pyright",
      "ruff",
      "eslint-lsp",
      "oxlint",
    },
  }
end

return M
