local function in_writing_mode()
  return vim.g.writing_mode or false
end

local function enable_writing_mode()
  vim.cmd('Goyo 120')
  vim.cmd('Limelight')
  vim.cmd('PencilSoft')
  vim.g.writing_mode = true
end

local function disable_writing_mode()
  vim.cmd('Goyo!')
  vim.cmd('Limelight!')
  vim.cmd('PencilOff')
  vim.g.writing_mode = false
end

vim.api.nvim_create_user_command(
  'WritingMode',
  function()
    if in_writing_mode() then
      disable_writing_mode()
    else
      enable_writing_mode()
    end
  end,
  { nargs = 0 }
)
