local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
}

function M.config()
  local icons = require "user.icons"

  require("ibl").setup {
    exclude = {
      buftypes = {
        "terminal",
        "nofile",
      },
      filetypes = {
        "help",
        "startify",
        "dashboard",
        "lazy",
        "neogitstatus",
        "neo-tree",
        "Trouble",
        "text",
      },
    },
    indent = {
      char = icons.ui.LineMiddle,
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    scope = { enabled = true },
  }
end

return M
