local M = {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
}

function M.config()
  require("nvim-web-devicons").setup {
    override = {
      astro = {
        icon = "",
        color = "#ff5f56",
        name = "astro",
      },
    },
  }
end

return M
