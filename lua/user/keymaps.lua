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

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Custom save keymaps
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
vim.keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit" })

vim.o.showtabline = 2

-- Tabs
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true, desc = "New tab" })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, desc = "Close tab" })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true, desc = "Close all except this" })
vim.api.nvim_set_keymap("n", "]t", ":tabn<CR>", { noremap = true, desc = "Next tab" })
vim.api.nvim_set_keymap("n", "[t", ":tabp<CR>", { noremap = true, desc = "Prev tab" })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<t", ":-tabmove<CR>", { noremap = true, desc = "Move tab to prev" })
-- move current tab to next position
vim.api.nvim_set_keymap("n", ">t", ":+tabmove<CR>", { noremap = true, desc = "Move tab to next" })
