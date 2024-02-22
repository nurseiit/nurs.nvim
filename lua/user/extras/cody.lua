local M = {
  "sourcegraph/sg.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  local wk = require "which-key"

  wk.register {
    ["<leader>fs"] = {
      "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>",
      "[F]ind in [S]ourcegraph",
    },
  }

  require("sg").setup {}
end

return M
