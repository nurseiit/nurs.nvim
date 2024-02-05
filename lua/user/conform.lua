local M = {
  "stevearc/conform.nvim",
}

function M.config()
  require("conform").setup {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      graphql = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      html = { "htmlbeautifier" },
      rust = { "rustfmt" },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      css = { { "prettierd", "prettier" } },
      scss = { { "prettierd", "prettier" } },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
  }
end

return M
