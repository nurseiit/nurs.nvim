local M = {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
}

function M.config()
  require("copilot").setup {
    panel = {
      enabled = false,
      auto_refresh = false,
      keymap = {
        -- jump_prev = "[[",
        -- jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
      layout = {
        position = "bottom", -- | top | left | right
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = false,
      auto_trigger = true,
      debounce = 150,
      keymap = {
        accept = "<C-CR>",
        accept_word = false,
        accept_line = false,
        next = "]]",
        prev = "[[",
        dismiss = false,
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
  }
end

return M
