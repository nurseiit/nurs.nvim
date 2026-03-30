local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
}

local parsers = {
  "c",
  "cpp",
  "go",
  "lua",
  "python",
  "rust",
  "toml",
  "tsx",
  "javascript",
  "jsdoc",
  "typescript",
  "vimdoc",
  "vim",
  "bash",
  "graphql",
  "scss",
  "css",
}

function M.config()
  require("nvim-treesitter").install(parsers)

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })

  vim.filetype.add {
    extension = {
      env = "bash",
    },
    filename = {
      [".env"] = "bash",
    },
    pattern = {
      ["%.env%.[%w_.-]+"] = "bash",
    },
  }
end

return M
