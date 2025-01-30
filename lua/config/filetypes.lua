-- File type configs

-- Markdown
local markdown_group = vim.api.nvim_create_augroup(
  'markdown',
  { clear = false }
)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown,md",
  group = markdown_group,
  callback = function()
    -- configuration goes in here
    vim.opt.colorcolumn = { 80, 100, 120 }
    vim.opt.textwidth = 79
    vim.opt.spell = true
    vim.opt.formatoptions:append("tcq")
    vim.opt.conceallevel = 0
    -- etc
  end,
})

-- Git specifically
local git_group = vim.api.nvim_create_augroup(
  'git',
  { clear = false }
)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  group = git_group,
  callback = function()
    -- Generally, line 1 of a Git Commit should be a title and only be 50 chars
    -- long.
    -- Next should be an empty line
    -- Then lines that reach about 72 or maximum 80 chars long
    vim.opt.colorcolumn = { 50, 72, 80 }
    vim.opt.textwidth = 79
    vim.opt.spell = true
    vim.opt.formatoptions:append("tcq")
  end,
})

-- LaTeX
local latex_group = vim.api.nvim_create_augroup(
  'latex',
  { clear = false }
)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  group = latex_group,
  callback = function()
    vim.opt.textwidth = 79
    vim.opt.spell = true
  end,
})

-- Mutt emails
local mutt_group = vim.api.nvim_create_augroup(
  'mutt',
  { clear = false }
)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*mutt-*",
  group = mutt_group,
  callback = function()
    vim.opt.filetype = "mail"
    vim.opt.undofile = false
    vim.opt.colorcolumn = { 72, 80, 100 }
    vim.opt.spell = true
    vim.opt.formatoptions:append("tcq")
  end,
})

-- Gemini files
local gemini_group = vim.api.nvim_create_augroup(
  'gemini',
  { clear = false }
)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gmi",
  group = gemini_group,
  callback = function()
    -- Gemini is column sensitive, so new lines should be purposefully added
    vim.opt.colorcolumn = nil
    vim.opt.spell = true
    vim.opt.wrap = true
  end,
})

-- HOCON .conf files
-- For now will match all .conf files
local hocon_group = vim.api.nvim_create_augroup("hocon", { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  { group = hocon_group, pattern = '*.conf', command = 'set ft=hocon' }
)

-- Quickfix window
local quickfix_group = vim.api.nvim_create_augroup(
  'quickfix',
  { clear = false }
)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  group = quickfix_group,
  callback = function()
    vim.opt.colorcolumn = nil
    vim.opt.relativenumber = false
  end,
})
