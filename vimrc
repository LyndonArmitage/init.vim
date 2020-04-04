
" Automatic install of plug if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle') " Using same dir as Vundle
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'aklt/plantuml-syntax'
Plug 'uarun/vim-protobuf'
Plug 'rhysd/vim-grammarous'
Plug 'wlue/vim-dm-syntax'
Plug 'calviken/vim-gdscript3'
Plug 'udalov/kotlin-vim'
Plug 'roxma/vim-paste-easy'
call plug#end()

" turn off vi compatibility mode
set nocompatible


" Plugin config below:


" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" set the below value to 1 to make syntastic check on opening a file
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" NERDTree
map <F4> :NERDTreeToggle<CR>

" vim markdown-config
let g:vim_markdown_folding_disabled = 1

" Specific markdown file settings
augroup markdown
	autocmd FileType markdown,md call SetMarkdownOptions()
	function SetMarkdownOptions()
		set colorcolumn=80
		set spell
	endfunction
augroup END

