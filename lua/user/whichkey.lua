local M = {
  "folke/which-key.nvim",
}

function M.config()
  local whichkey = require "which-key"

  local normal_mappings = {
    c = { name = "[C]ode", _ = "which_key_ignore" },
    d = { name = "[D]ocument", _ = "which_key_ignore" },
    g = { name = "[G]it", _ = "which_key_ignore" },
    h = { name = "Git [H]unk", _ = "which_key_ignore" },
    f = { name = "[F]ind / Search", _ = "which_key_ignore" },
    k = { name = "Wor[k]space", _ = "which_key_ignore" },
  }

  whichkey.register(normal_mappings, {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  })

  whichkey.register({
    ["<leader>"] = { name = "VISUAL <leader>" },
    ["<leader>h"] = { "Git [H]unk" },
  }, { mode = "v" })
end

return M
