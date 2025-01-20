local M = {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
}

function M.config() end
vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    on_attach = function(_client, bufnr)
      local format_sync_grp = vim.api.nvim_create_augroup("RustaceanFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
        group = format_sync_grp,
      })
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          features = "all",
        },
        -- rustfmt = {
        --   overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
        -- },
        procMacro = {
          ignored = {
            leptos_macro = {
              -- optional: --
              -- "component",
              -- "server",
            },
          },
        },
        cachePriming = {
          enable = false,
        },
        checkOnSave = false,
        check = {
          allTargets = false,
          workspace = false,
        },
      },
    },
  },
}
return M
