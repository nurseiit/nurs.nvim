local M = {
  "polarmutex/git-worktree.nvim",
  version = "^2",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  vim.g.git_worktree = {
    change_directory_command = "cd",
    update_on_change = true,
    update_on_change_command = "e .",
    clearjumps_on_change = true,
    confirm_telescope_deletions = true,
    autopush = false,
  }

  local Hooks = require "git-worktree.hooks"
  local config = require "git-worktree.config"
  local update_on_switch = Hooks.builtins.update_current_buffer_on_switch

  Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
    vim.notify("Moved from " .. prev_path .. " to " .. path)
    update_on_switch(path, prev_path)
  end)

  Hooks.register(Hooks.type.DELETE, function()
    vim.cmd(config.update_on_change_command)
  end)

  require("telescope").load_extension "git_worktree"

  local wk = require "which-key"

  wk.add {
    {
      "<leader>gw",
      "<cmd>Telescope git_worktree git_worktree<cr>",
      desc = "Open Worktree Toolbar",
    },
    {
      "<leader>gwa",
      "<cmd>Telescope git_worktree create_git_worktree<cr>",
      desc = "Create New Worktree",
    },
  }
end

return M
