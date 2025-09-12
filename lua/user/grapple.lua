local M = {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  keys = {
    { "<s-m>", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<TAB>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
    { "<leader><TAB>", "<cmd>Telescope grapple tags<cr>", desc = "List all tags with Telescope" },

    { "[b", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
    { "]b", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
  },
}

function M.config()
  require("grapple").setup {
    scope = "git_branch",
    icons = true,
    status = true,
  }

  require("telescope").load_extension "grapple"
end

return M
