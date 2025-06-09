-- Remaps for Vim

-- Yank everything to clipboard
vim.keymap.set("n", "<leader>ya", ":%y+<CR>", { desc = "Yank all contents to system clipboard" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank line to system clipboard" })

-- Paste from system clipboard using <leader>p in normal mode
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system keyboard", noremap = true, silent = true })
-- Paste from system clipboard using <leader>P to paste before the cursor
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from system keyboard", noremap = true, silent = true })

-- Quickfix and location window navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quickfix window next" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quickfix window previous" })
vim.keymap.set("n", "<leader>c", "<cmd>cclose<CR>", { desc = "Close Quickfix window" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Location window next" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Location window previous" })

-- Remove bindings
vim.keymap.set("n", "Q", "<NOP>")

-- Set terminal binding for easier exiting
vim.keymap.set("t", "<leader><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
