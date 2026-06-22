local M = {
  "echasnovski/mini.indentscope",
  event = "VeryLazy",
}

function M.config()
  require("mini.indentscope").setup {
    symbol = "│",
    options = { try_as_border = true },
    draw = {
      animation = require("mini.indentscope").gen_animation.none(),
    },
  }
end

return M
