return {
  -- Treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "master",
    build = ":TSUpdate",
    config = function()
      require 'nvim-treesitter.configs'.setup {
        modules = {},

        ensure_installed = {
          "bash",
          "markdown",
          "markdown_inline",
          "json",
          "html",
          "javascript",
          "java",
          "scala",
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "gitcommit",
          "gitignore",
          "yaml",
          "xml",
          "toml",
          "sql",
          "python"
        },

        ignore_install = {},

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }

      require 'treesitter-context'.setup {
        max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
      }
    end
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
}
