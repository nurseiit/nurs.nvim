local M = {
  "stevearc/conform.nvim",
}

function M.config()
  require("conform").setup {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome", "prettier", stop_after_first = true },
      typescript = { "biome", "prettier", stop_after_first = true },
      javascriptreact = { "biome", "prettier", stop_after_first = true },
      typescriptreact = { "biome", "prettier", stop_after_first = true },
      astro = { "prettier", stop_after_first = true },
      json = { "biome", "prettier", stop_after_first = true },
      graphql = { "biome", "prettier", stop_after_first = true },
      markdown = { "biome", "prettier", stop_after_first = true },
      html = { "htmlbeautifier" },
      rust = { "rustfmt" },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      css = { "biome", "prettier", stop_after_first = true },
      scss = { "biome", "prettier", stop_after_first = true },
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
