-- Remaps for Vim

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank everything to clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
