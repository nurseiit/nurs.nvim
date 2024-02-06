local M = {
  "linrongbin16/gitlinker.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>gy"] = { "<cmd>GitLink!<cr>", "Git link" },
    ["<leader>gY"] = { "<cmd>GitLink blam<cr>", "Git link blame" },
  }

  require("gitlinker").setup {
    message = false,
    console_log = false,
    router = {
      browse = {
        ["^github.palantir.build"] = require("gitlinker.routers").github_browse,
      },
      blame = {
        ["^github.palantir.build"] = require("gitlinker.routers").github_blame,
      },
    },
  }
end

return M
