local M = {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  opts = {},
}

function M.config()
  require("diagflow").setup()
end

return M
