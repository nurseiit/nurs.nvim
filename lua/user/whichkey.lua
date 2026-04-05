local M = {
  "folke/which-key.nvim",
}

function M.config()
  local wk = require "which-key"

  wk.add {
    {
      mode = "n",
      { "<leader>g", name = "[G]it" },
      { "<leader>f", name = "[F]ind / Search" },
      { "<leader>l", desc = "[L]SP" },
      { "<leader>t", desc = "[T]ab" },
    },
  }

  wk.add {
    mode = "v",
    { "<leader>l", desc = "LSP" },
  }
end

return M
