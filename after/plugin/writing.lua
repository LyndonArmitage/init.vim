vim.api.nvim_create_user_command(
  'WritingMode',
  function()
    if vim.fn.exists(':Goyo') ~= 2 then
      print('Error: Goyo command not found')
      return
    end
    if vim.fn.exists(':Limelight') ~= 2 then
      print('Error: Limelight command not found')
      return
    end
    if vim.fn.exists(':PencilSoft') ~= 2 then
      print('Error: PencilSoft command not found')
      return
    end
    vim.cmd('Goyo 120')
    vim.cmd('Limelight')
    vim.cmd('PencilSoft')
  end,
  { nargs = 0 }
)
