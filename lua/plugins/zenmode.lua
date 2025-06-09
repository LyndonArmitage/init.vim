return {
  "folke/zen-mode.nvim",
  cmd = {
    "ZenMode"
  },
  keys = {
    {
      "<leader>zz",
      function()
        require("zen-mode").setup {
          window = {
            width = 100,
            options = {}
          },
          plugins = {
            twilight = { enabled = false },
            tmux = {
              enabled = true,
            },
            alacritty = {
              enabled = true,
              font = "18",
            },
          },
        }
        require("zen-mode").toggle()
      end,
      mode = "n",
      desc = "Toggle Zen Mode"
    },
    {
      "<leader>zZ",
      function()
        require("zen-mode").setup {
          window = {
            width = 90,
            options = {
              signcolumn = "no",
              number = false,
              relativenumber = false,
            }
          },
          plugins = {
            twilight = { enabled = true },
            tmux = {
              enabled = true,
            },
            alacritty = {
              enabled = true,
              font = "20",
            }
          },
        }
        require("zen-mode").toggle()
      end,
      mode = "n",
      desc = "Toggle Full Zen Mode"
    },
  }
}
