-- Config in case running neovim in some kind of GUI

if vim.g.neovide then
  vim.o.guifont = "DejaVuSansM Nerd Font Mono:h12"
  -- turn off the annoying cursor animation
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_short_animation_length = 0
  vim.g.neovide_cursor_vfx_mode = ""
end
