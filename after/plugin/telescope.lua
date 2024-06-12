local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags" })
vim.keymap.set('n', 'z=', builtin.spell_suggest, { desc = "Spelling Suggestions" })

require('telescope').load_extension('fzf')
