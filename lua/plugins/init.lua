return {

  -- This is the theme
  {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme nightfox]])
  end,
  },

  -- Nice file editor
  { "stevearc/oil.nvim" },

  -- Useful commands for plugins
  {
    "nvim-lua/plenary.nvim",
    lazy = false
  },

  -- fuzzy file finder
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'make',
    dependencies = { "nvim-telescope/telescope.nvim" }
  },

  -- Icons used by other plugins
  { "nvim-tree/nvim-web-devicons", opts = {} },

  -- Status Line
  {
    "vim-airline/vim-airline",
    lazy = false,
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = false,
    dependencies = { "vim-airline/vim-airline" },
  },


  -- Treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    'nvim-treesitter/playground',
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },

  -- Git related plugins
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim" },


  -- Snippets for programming
  { "rafamadriz/friendly-snippets" },

  -- Debugging support
  { "mfussenegger/nvim-dap" },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
  },

  -- pretty diagnostics
  {
    "folke/trouble.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },

  -- arrow
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- or if using `mini.icons`
      -- { "echasnovski/mini.icons" },
    },
    opts = {
      show_icons = true,
      leader_key = ';', -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    }
  },

  -- Automatic pasting
  { "roxma/vim-paste-easy" },

  -- Add back gx for opening links
  {
    "josa42/nvim-gx",
    config = function()
      vim.keymap.set('n', 'gx', require('gx').gx, { desc = "Open in Browser" })
    end
  },

  -- ChatGPT? At this time of year? At this time of day? In this operating
  -- system? Localised within your editor?
   { "robitx/gp.nvim" },

  -- Heritage simply makes sure any parent directories exist when writing a new
  -- file.
  { "jessarcher/vim-heritage" },

  -- PlantUML Syntax is not supported by Tree Sitter
  { "aklt/plantuml-syntax" },
  { "tyru/open-browser.vim" },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
  -- Add comment highlighting
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  -- // TODO: Foo

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

}
