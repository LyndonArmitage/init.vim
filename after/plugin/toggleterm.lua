require("toggleterm").setup {

  vim.keymap.set("n", "<leader>`", vim.cmd.ToggleTerm, { desc = "Toggle Terminal" })

}
