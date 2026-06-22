local M = {
  "nickjvandyke/opencode.nvim",
  version = "*",
}

function M.config()
  vim.g.opencode_opts = {}

  vim.o.autoread = true

  vim.keymap.set({ "n", "x" }, "<leader>na", function()
    require("opencode").ask "@this: "
  end, { desc = "Ask OpenCode..." })

  vim.keymap.set({ "n", "x" }, "<leader>ns", function()
    require("opencode").select()
  end, { desc = "Select OpenCode..." })

  vim.keymap.set({ "n", "x" }, "no", function()
    return require("opencode").operator "@this "
  end, { desc = "Append range to OpenCode", expr = true })

  vim.keymap.set("n", "noo", function()
    return require("opencode").operator "@this " .. "_"
  end, { desc = "Append line to OpenCode", expr = true })

  vim.keymap.set("n", "<S-C-u>", function()
    require("opencode").command "session.half.page.up"
  end, { desc = "Scroll OpenCode up" })

  vim.keymap.set("n", "<S-C-d>", function()
    require("opencode").command "session.half.page.down"
  end, { desc = "Scroll OpenCode down" })
end

return M
