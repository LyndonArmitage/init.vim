return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      -- refer to `:h file-pattern` for more examples
      "BufReadPre /home/lyndon/Documents/obsidian/Work Notes/*.md",
      "BufNewFile /home/lyndon/Documents/obsidian/Work Notes/*.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see https://github.com/epwalsh/obsidian.nvim for full list of optional dependencies
    },
    opts = {
      workspaces = {
        {
          name = "work",
          path = "~/Documents/obsidian/Work Notes",
        },
      },
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Daily Notes",
      },
      -- Optional, for templates (see below).
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },

      -- see https://github.com/epwalsh/obsidian.nvim for full list of options
    },
  },
  {
    "oflisback/obsidian-bridge.nvim",
    opts = {
      -- your config here
    },
    event = {
      "BufReadPre /home/lyndon/Documents/obsidian/Work Notes/*.md",
      "BufNewFile /home/lyndon/Documents/obsidian/Work Notes/*.md",
    },
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }
}
