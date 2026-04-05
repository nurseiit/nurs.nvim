local M = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
}

function M.config()
  require("illuminate").configure {
    filetypes_denylist = {
      "mason",
      "DressingInput",
      "DressingSelect",
      "qf",
      "alpha",
      "lazy",
      "neo-tree",
      "TelescopePrompt",
    },
  }
end

return M
