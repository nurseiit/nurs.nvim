local M = {
  "supermaven-inc/supermaven-nvim",
}

function M.config()
  require("supermaven-nvim").setup {
    keymaps = {
      accept_suggestion = "<C-y>",
    },
    log_level = "error",
  }
end

return M
