local M = {
  "stevearc/conform.nvim",
}

function M.config()
  require("conform").setup {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Use a sub-list to run only the first available formatter
      javascript = { { "prettier", "prettierd" } },
      typescript = { { "prettier", "prettierd" } },
      javascriptreact = { { "prettier", "prettierd" } },
      typescriptreact = { { "prettier", "prettierd" } },
      -- json = { { "prettierd", "prettier" } },
      graphql = { { "prettier", "prettierd" } },
      markdown = { { "prettier", "prettierd" } },
      html = { "htmlbeautifier" },
      rust = { "rustfmt" },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      css = { { "prettier", "prettierd" } },
      scss = { { "prettier", "prettierd" } },
      python = { "ruff_format" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = false,
    },
  }
end

return M
