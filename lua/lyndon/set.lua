vim.g.mapleader = " "
vim.opt.updatetime = 300

vim.opt.hidden = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.mouse = 'a'

vim.opt.wrap = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo-dir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = { 80, 100, 120 }
