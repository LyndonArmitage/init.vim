return {
  -- Treesitter syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install {
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
