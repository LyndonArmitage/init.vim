-- Remaps for Vim

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank everything to clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>")
