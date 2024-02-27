-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fuzzy file finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- This should speed up telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- harpoon is supposed to make it quicker to jump between stuff
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } }
  }

  -- Theme for NeoVim
  use {
    "EdenEast/nightfox.nvim",
    config = function() vim.cmd.colorscheme("nightfox") end
  }

  -- Tree Sitter for nice syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use 'nvim-treesitter/playground'
  use("nvim-treesitter/nvim-treesitter-context")

  -- Undo-Tree
  use 'mbbill/undotree'

  -- Git Related plugin
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

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

  -- NeoVim LSP help
  use 'folke/neodev.nvim'

  -- Snippets for all sorts of programming languages
  use "rafamadriz/friendly-snippets"

  -- Pretty windows for diagnostics etc
  use({ "folke/trouble.nvim", requires = 'nvim-tree/nvim-web-devicons' })

  -- Debugging support
  use 'mfussenegger/nvim-dap'

  -- LSP For Scala
  use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })

  -- Debugging for python
  use 'mfussenegger/nvim-dap-python'

  -- enable paste when pasting automatically
  use 'roxma/vim-paste-easy'

  -- Some nice status line stuff
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'nvim-tree/nvim-web-devicons'

  -- Nicer file tree view
  use 'stevearc/oil.nvim'

  -- Add back gx opening links
  use ({
    'josa42/nvim-gx',
    config = function() vim.keymap.set('n', 'gx', require('gx').gx) end
  })
  -- in nvim 10.X this will not be needed

  -- ChatGPT? At this time of year? At this time of day? In this operating
  -- system? Localised within your editor?
  use 'robitx/gp.nvim'

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Markdown previews
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
end)
