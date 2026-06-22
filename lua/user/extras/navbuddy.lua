local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local icons = require "user.icons"

  require("nvim-navic").setup {
    icons = icons.kind,
    highlight = true,
    lsp = { auto_attach = true },
    click = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }

  local wk = require "which-key"
  wk.add {
    { "<leader>b", "<cmd>Navbuddy<cr>", desc = "Nav buddy" },
  }

  local navbuddy = require "nvim-navbuddy"
  navbuddy.setup {
    window = {
      border = "rounded",
    },
    icons = icons.kind,
    lsp = { auto_attach = true },
  }

  vim.keymap.set("n", "<m-s>", "<cmd>silent only | Navbuddy<cr>", { desc = "Navbuddy fullscreen" })
  vim.keymap.set("n", "<m-o>", "<cmd>silent only | Navbuddy<cr>", { desc = "Navbuddy fullscreen" })
end

return M
