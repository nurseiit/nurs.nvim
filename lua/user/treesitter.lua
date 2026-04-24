local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
}

local ensure_install = {
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
  "ocaml",
  "reason",
}

function M.config()
  vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
      require("nvim-treesitter.parsers").reason = {
        install_info = {
          url = "https://github.com/reasonml-editor/tree-sitter-reason",
          branch = "master",
          queries = "queries/reason",
        },
      }
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })

  vim.filetype.add {
    extension = {
      env = "bash",
      re = "reason",
    },
    filename = {
      [".env"] = "bash",
    },
    pattern = {
      ["%.env%.[%w_.-]+"] = "bash",
    },
  }

  vim.treesitter.language.register("reason", { "re" })

  require("nvim-treesitter").install(ensure_install)
end

return M
