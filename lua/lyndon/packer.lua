-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Theme for NeoVim
  use {
    "EdenEast/nightfox.nvim",
    config = function() vim.cmd.colorscheme("nightfox") end
  }

  -- Tree Sitter for nice syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }
  use 'nvim-treesitter/playground'
  use("nvim-treesitter/nvim-treesitter-context")

  -- Undo-Tree
  use 'mbbill/undotree'

  -- Git Related plugin
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- LSP for most languages
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  -- Debugging support
  use 'mfussenegger/nvim-dap'

  -- LSP For Scala
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})

  -- enable paste when pasting automatically
  use 'roxma/vim-paste-easy'

  -- Some nice status line stuff
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nvim-tree/nvim-web-devicons'

  -- Nicer file tree view
  use 'stevearc/oil.nvim'

  -- ChatGPT? At this time of year? At this time of day? In this operating
  -- system? Localised within your editor?
  use 'robitx/gp.nvim'

end)
