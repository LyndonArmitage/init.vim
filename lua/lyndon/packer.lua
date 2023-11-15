
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Theme for NeoVim
  use { 
    "EdenEast/nightfox.nvim",
    config = function() vim.cmd.colorscheme("nightfox") end
  }

  -- Tree Sitter for nice syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}
  }
  use 'nvim-treesitter/playground'

  -- Undo-Tree
  use 'mbbill/undotree'

  -- Git Related plugin
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use 'roxma/vim-paste-easy'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

end)
