local M = {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
}

function M.config()
  local lsp = require "user.lsp"
  require("typescript-tools").setup {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities(),
  }
end

return M
