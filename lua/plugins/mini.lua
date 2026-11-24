return {
  "nvim-mini/mini.input",
  version = "*",
  priority = 1000,
  lazy = false,
  config = function()
    require("mini.input").setup()
  end,
}
