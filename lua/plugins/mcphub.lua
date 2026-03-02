return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "bundled_build.lua", -- Bundles `mcp-hub` binary along with the neovim plugin
  config = function()
    local mcphub = require("mcphub")
    mcphub.setup({
      use_bundled_binary = true, -- Use local `mcp-hub` binary
    })
  end,
}
