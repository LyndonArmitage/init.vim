return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "openai",
        model = "gpt-5",
      },
      inline = {
        adapter = "openai",
        model = "gpt-5",
      },
      cmd = {
        adapter = "openai",
        model = "gpt-5",
      },
    },
    adapters = {
      openai = function()
        local config_dir = vim.fn.stdpath('config')
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = "cmd:bash " .. config_dir .. "/get-openai-api.sh",
          },
        })
      end,
    },
  },
}
