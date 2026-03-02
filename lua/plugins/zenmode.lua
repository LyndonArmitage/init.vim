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
            neovide = {
              enabled = true,
              scale = 1.8,
            },
          },
          on_open = function()
            if vim.fn.exists(":PencilSoft") then
              vim.cmd("PencilSoft")
            end
          end,
          on_close = function()
            if vim.fn.exists(":PencilOff") then
              vim.cmd("PencilOff")
            end
          end,
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
            },
            neovide = {
              enabled = true,
              scale = 2.0,
            },
          },
          on_open = function()
            if vim.fn.exists(":PencilSoft") then
              vim.cmd("PencilSoft")
            end
          end,
          on_close = function()
            if vim.fn.exists(":PencilOff") then
              vim.cmd("PencilOff")
            end
          end,
        }
        require("zen-mode").toggle()
      end,
      mode = "n",
      desc = "Toggle Full Zen Mode"
    },
  }
}
