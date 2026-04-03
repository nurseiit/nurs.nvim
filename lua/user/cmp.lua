local M = {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  opts = {
    snippets = { preset = "default" },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    signature = { enabled = true },
    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = { border = "rounded" },
      },
      menu = {
        border = "rounded",
        scrollbar = false,
      },
    },
    cmdline = {
      keymap = {
        preset = "inherit",
        ["<CR>"] = { "accept_and_enter", "fallback" },
      },
    },
    sources = {
      default = { "lsp", "snippets", "path", "buffer" },
      providers = {
        snippets = {
          opts = {
            search_paths = { vim.fn.stdpath("config") .. "/lua/user/snippets" },
          },
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}

return M
