-- Set the leader keys, note these may be overridden by plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- A faster update time is always nice for some plugins
vim.opt.updatetime = 300

-- This makes sure that buffers end up hidden and not just closed
vim.opt.hidden = true

-- Remove the writing of swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Sensible tab sizes
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line numbers and mouse support
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.relativenumber = true

-- Disable wrapping
vim.opt.wrap = false

-- Persistant Undos
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo-dir"
vim.opt.undofile = true

-- Search related stuff
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Setting this for all files since 90% of time its a set of sensible defaults
vim.opt.colorcolumn = { 80, 100, 120 }
