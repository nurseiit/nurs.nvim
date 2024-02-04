local M = {
  -- Surround, mainly for cs"' to change quote types
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup()
end

return M
