local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local keymap = vim.keymap.set
  local harpoon = require "harpoon"

  harpoon:setup {}

  keymap("n", "<s-m>", function()
    harpoon:list():append()
    vim.notify "󱡅  marked file"
  end)
  keymap("n", "<TAB>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  keymap("n", "[b", function()
    harpoon:list():prev()
  end)
  keymap("n", "]b", function()
    harpoon:list():next()
  end)
end

return M
