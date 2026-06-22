-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Custom save keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
vim.keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit" })

-- Comments (built-in gc/gcc since 0.10+)
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, desc = "Toggle comment for selection" })

-- Tabs
vim.keymap.set("n", "<leader>ta", "<cmd>$tabnew<cr>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "Quit tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close all except this" })
vim.keymap.set("n", "]t", "<cmd>tabn<cr>", { desc = "Next tab" })
vim.keymap.set("n", "[t", "<cmd>tabp<cr>", { desc = "Prev tab" })
vim.keymap.set("n", "<t", "<cmd>-tabmove<cr>", { desc = "Move tab to prev" })
vim.keymap.set("n", ">t", "<cmd>+tabmove<cr>", { desc = "Move tab to next" })
