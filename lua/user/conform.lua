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
      rust = { "rustfmt", "leptosfmt" },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      css = { "biome", "prettier", stop_after_first = true },
      scss = { "biome", "prettier", stop_after_first = true },
      python = { "ruff_format" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end

      return {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = false,
      }
    end,
    formatters = {
      leptosfmt = {
        command = "leptosfmt",
        args = { "--stdin" },
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
