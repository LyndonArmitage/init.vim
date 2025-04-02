# Lyndon's NeoVim Config

These are my current [NeoVim](https://github.com/neovim/neovim) configuration
files.

These were rewritten from Vimscript to Lua at the end of 2023.

## Requirements

- NeoVim 0.11+.
- `treesitter` is needed for the various syntax highlighting
- `git` is needed
- `pass` is needed for getting credentials for the OpenAI plugin
- `luarocks` is needed for `lazy.nvim`
- LSP Support requires that you install various external programs, documented
  in the config for it
- A [Nerd Font](https://www.nerdfonts.com/) isn't strictly needed but is nice
  to have

## Plugin Management

Plugin management is an annoying thing in vim as there are so many solutions!

Before 2024 I used [Vundle](https://github.com/VundleVim/Vundle.vipm), and 
switched to [vim-plug](https://github.com/junegunn/vim-plug) at some point.

At the end of 2023 I switched to permenently using NeoVim and the plugin
manager [packer.nvim](https://github.com/wbthomason/packer.nvim), even though
it had just been abandoned.

At the end of January 2025, I decided to switch to
[lazy.nvim](https://github.com/folke/lazy.nvim), as it is heavily supported.
