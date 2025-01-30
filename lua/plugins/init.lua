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
  { "stevearc/oil.nvim",           opts = {} },

  -- Useful commands for plugins
  {
    "nvim-lua/plenary.nvim",
    lazy = false
  },

  -- fuzzy file finder
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Find Git Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffer" })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help Tags" })
      vim.keymap.set('n', 'z=', builtin.spell_suggest, { desc = "Spelling Suggestions" })

      require("telescope").load_extension("fzf")
    end
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
    init = function()
      vim.g.airline_powerline_fonts = 1
    end
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
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  -- Autoclosing of tags in html and other document types with tags
  {
    "windwp/nvim-ts-autotag",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  },

  -- Git related plugins
  {
    "tpope/vim-fugitive",
    keys = {
      {
        "<leader>gs",
        "<cmd>Git<cr>",
        desc = "Git Fugitive Window",
      },
    },
    cmd = {
      "G",
      "Git",
      "Gedit",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "Glgrep",
      "GMove",
      "GDelete",
      "GBrowse"
    },
    dependencies = {
      -- Adds ability to GBrowse to GitHub
      "tpope/vim-rhubarb",
      -- Adds ability to GBrowse GitLab
      "shumphrey/fugitive-gitlab.vim",
    }
  },
  -- Git signs are nice to have to show changes at a glance
  { "lewis6991/gitsigns.nvim", opts = {} },

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
      leader_key = ';',        -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    }
  },

  -- Automatic pasting
  { "roxma/vim-paste-easy" },

  -- ChatGPT? At this time of year? At this time of day? In this operating
  -- system? Localised within your editor?
  {
    "robitx/gp.nvim",
    opts = function()
      -- Get Key from an invoked command
      local config_dir = vim.fn.stdpath('config')
      return {
        openai_api_key = { "bash", config_dir .. "/get-openai-api.sh" }
      }
    end,
    keys = {
      {
        "<C-g>f",
        "<cmd>GpChatFinder<cr>",
        desc = "GPT Chat Finder",
        noremap = true,
        silent = true,
        nowait = true,
      },
      {
        "<C-g>c",
        "<cmd>GpChatNew<cr>",
        desc = "GPT New Chat",
        noremap = true,
        silent = true,
        nowait = true,
      },
      {
        "<C-g>t",
        "<cmd>GpChatToggle<cr>",
        desc = "GPT Toggle Chat",
        noremap = true,
        silent = true,
        nowait = true,
      },
    },
    cmd = {
      "GpChatNew",
      "GpChatPaste",
      "GpChatToggle",
      "GpChatFinder",
      "GpChatRespond",
      "GpChatDelete",
      "GpRewrite",
      "GpAppend",
      "GpPrepend",
      "GpEnew",
      "GpNew",
      "GpVnew",
      "GpTabnew",
      "GpPopup",
      "GpImplement",
      "GpContext",
      "GpWhisper",
      "GpWhisperRewrite",
      "GpWhisperAppend",
      "GpWhisperPrepend",
      "GpWhisperEnew",
      "GpWhisperNew",
      "GpWhisperVnew",
      "GpWhisperTabnew",
      "GpWhisperPopup",
      "GpNextAgent",
      "GpAgent",
      "GpImage",
      "GpImageAgent",
      "GpStop",
      "GpInspectPlugin",
    },
  },

  -- Heritage simply makes sure any parent directories exist when writing a new
  -- file.
  { "jessarcher/vim-heritage" },

  -- PlantUML Syntax is not supported by Tree Sitter
  { "aklt/plantuml-syntax" },
  { "tyru/open-browser.vim",  lazy = true },
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
    ft = "plantuml",
  },
  -- Add comment highlighting
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
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
