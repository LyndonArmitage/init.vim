-- Remaps for Vim

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank everything to clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Quickfix and location window navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Remove bindings
vim.keymap.set("n", "Q", "<NOP>")
