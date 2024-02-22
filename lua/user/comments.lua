local M = {
  "numToStr/Comment.nvim",
  opts = function()
    local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
  end,
}

function M.config()
  vim.keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
  end, {
    desc = "Toggle comment line",
  })
  vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {
    desc = "Toggle comment for selection",
  })
end

return M
