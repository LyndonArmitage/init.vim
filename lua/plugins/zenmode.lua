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
            tmux = {
              enabled = true,
            },
            alacritty = {
              enabled = true,
              font = "20",
            }
          },
          on_open = function()
            vim.cmd('Limelight')
          end,
          on_close = function()
            vim.cmd('Limelight!')
          end,
        }
        require("zen-mode").toggle()
      end,
      mode = "n",
      desc = "Toggle Full Zen Mode"
    },
  }
}
