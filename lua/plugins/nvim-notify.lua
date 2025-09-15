return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    -- Set default notification to this plugin
    vim.notify = require("notify")
  end
}
