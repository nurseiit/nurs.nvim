local M = {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
}

function M.config()
  -- local typescript_tools = require "typescript-tools"
  -- typescript_tools.setup {
  --   lsp = {
  --     capabilities = vim.lsp.protocol.make_client_capabilities(),
  --     on_attach = function(client, bufnr)
  --       -- Add your custom keymaps here
  --       -- lsp_keymaps(bufnr)
  --     end,
  --   },
  --   tools = {
  --     autoSetHints = true,
  --     hover_with_actions = true,
  --     inlay_hints = {
  --       auto = true,
  --       only_current_line = false,
  --     },
  --   },
  -- }
end

return M
