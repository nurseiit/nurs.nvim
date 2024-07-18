local M = {
  "folke/which-key.nvim",
}

function M.config()
  local wk = require "which-key"

  wk.add {
    {
      mode = "n",
      { "<leader>c", name = "[C]ode" },
      { "<leader>d", name = "[D]ocument" },
      { "<leader>g", name = "[G]it" },
      { "<leader>h", name = "Git [H]unk" },
      { "<leader>f", name = "[F]ind / Search" },
      { "<leader>k", name = "Wor[k]space" },
      { "<leader>l", desc = "[L]SP" },
    },
  }

  wk.add {
    mode = "v",
    { "<leader>", group = "VISUAL <leader>" },
    { "<leader>h", desc = "Git [H]unk" },
    { "<leader>l", desc = "LSP" },
  }
end

return M
