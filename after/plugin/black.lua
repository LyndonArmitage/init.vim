-- Get Nvim to call Python black command on current buffer
vim.api.nvim_create_user_command(
  'Black',
  function()
    vim.cmd('!black %')
  end,
  { nargs = 0 }
)
