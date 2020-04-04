" This is how you source and share the original .vimrc file
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.config/nvim/vimrc
" Should make sure that ~/.vimrc is symlinked to the .vimrc here

