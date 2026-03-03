-- Config in case running neovim in some kind of GUI

if vim.g.neovide then
  vim.o.guifont = "DejaVuSansM Nerd Font Mono:h12"
  -- turn off the annoying cursor animation
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_short_animation_length = 0
  vim.g.neovide_cursor_vfx_mode = ""

  -- Add CTRL+SHIFT+V as a paste command from system clipboard/register
  vim.keymap.set({ "n", "v", "i", "c" }, "<C-S-v>", function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { noremap = true, silent = true })
end
