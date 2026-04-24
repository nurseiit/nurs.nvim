local M = {
  "stevearc/conform.nvim",
}

function M.config()
  require("conform").setup {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "biome-check", "prettier", stop_after_first = true },
      typescript = { "biome-check", "prettier", stop_after_first = true },
      javascriptreact = { "biome-check", "prettier", stop_after_first = true },
      typescriptreact = { "biome-check", "prettier", stop_after_first = true },
      astro = { "prettier", stop_after_first = true },
      json = { "biome-check", "prettier", stop_after_first = true },
      graphql = { "biome-check", "prettier", stop_after_first = true },
      markdown = { "biome-check", "prettier", stop_after_first = true },
      html = { "htmlbeautifier" },
      rust = { "rustfmt", "leptosfmt" },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      css = { "biome-check", "prettier", stop_after_first = true },
      scss = { "biome-check", "prettier", stop_after_first = true },
      python = { "ruff_format" },
      sh = { "shfmt" },
      sql = { "sqlfmt" },
      reason = { "refmt" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "never",
      }
    end,
    formatters = {
      leptosfmt = {
        command = "leptosfmt",
        args = { "--stdin" },
      },
      refmt = {
        command = "refmt",
      },
    },
  }

  -- Add commands to disable autoformat-on-save
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      -- FormatDisable! will disable formatting just for this buffer
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end, {
    desc = "Disable autoformat-on-save",
    bang = true,
  })
  vim.api.nvim_create_user_command("FormatEnable", function()
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, {
    desc = "Re-enable autoformat-on-save",
  })
end

return M
