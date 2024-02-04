local M = {
  "folke/tokyonight.nvim",
  lazy = false, -- load on startup
  priority = 1000, -- load before all other plugins
}

function M.config()
  vim.cmd [[colorscheme tokyonight-moon]]
end

return M
