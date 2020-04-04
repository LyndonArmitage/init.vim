# Lyndon's init.vim/.vimrc

These are my current vim configuration files.

Originally I used `vim` 8+ but will be switching to `neovim`. I have included my
original .vimrc file for reference but will be deleting everything and starting
from scratch.  
I will focus on compatibility with `neovim`.

## Plugin Management

Originally I was using Vundle for my plugins. But have now switched to vim-plug.

This was not a complex change to make.

## Autocompletion

For autocomplete I have decided to use coc.vim.  
It is a Language Server Protocol based plugin that you can install linters and
servers for.

You install these using `:CocInstall` inside vim and in theory they should all
run fine without any special configuration.
