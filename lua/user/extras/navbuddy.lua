local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>b", "<cmd>Navbuddy<cr>", desc = "Nav buddy" },
  }

  local navbuddy = require "nvim-navbuddy"

  navbuddy.setup {
    window = {
      border = "rounded",
    },
    icons = require("user.icons").kind,
    lsp = { auto_attach = true },
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
  keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
end

return M
