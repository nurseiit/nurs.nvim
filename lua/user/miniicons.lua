local M = {
  "nvim-mini/mini.icons",
  lazy = false,
}

function M.config()
  local icons = require "mini.icons"
  icons.setup()
  icons.mock_nvim_web_devicons()
end

return M
