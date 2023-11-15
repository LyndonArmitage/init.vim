
" Automatic install of plug if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle') " Using same dir as Vundle
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'roxma/vim-paste-easy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'geverding/vim-hocon'
call plug#end()

" turn off vi compatibility mode
set nocompatible

" Set spacebar to leader
nnoremap <SPACE> <Nop>
let mapleader = " "

" Plugin config below:

" Airline
let g:airline_powerline_fonts = 1


set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Basic vim code
set tabstop=2 shiftwidth=2 expandtab
set number
set mouse=a

" Allow sourcing of .vimrc from local files
set exrc
" Will restrict usage of some commands in local vimrc files
set secure

if has('persistent_undo')
  " https://vi.stackexchange.com/a/53
  " Let's save undo info!
  if !isdirectory($HOME."/.vim")
      call mkdir($HOME."/.vim", "", 0770)
  endif
  if !isdirectory($HOME."/.vim/undo-dir")
      call mkdir($HOME."/.vim/undo-dir", "", 0700)
  endif
  set undodir=~/.vim/undo-dir
  set undofile
endif

" START: FileType Mappings
" Specific markdown file settings
augroup markdown
	autocmd FileType markdown,md call SetMarkdownOptions()
	function SetMarkdownOptions()
		set colorcolumn=80,100,120
		set textwidth=79
    set spell
    set formatoptions+=tcq
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_folding_disabled = 1
    set conceallevel=0
	endfunction
augroup END

augroup git
  autocmd FileType gitcommit call SetGitOptions()
  function SetGitOptions()
    set noundofile
    set colorcolumn=72,80
    set textwidth=79
  endfunction
augroup END

augroup c
  autocmd FileType c call SetCOptions()
  autocmd FileType cpp call SetCOptions()
  function SetCOptions()
    set colorcolumn=80,100,120
  endfunction
augroup END

augroup latex
  autocmd FileType tex call SetLatexOptions()
  function SetLatexOptions()
    set colorcolumn=80
    set textwidth=79
    set formatoptions+=tcq
    set spell
  endfunction
augroup END

augroup scala
  autocmd FileType scala call SetScalaOptions()
  function SetScalaOptions()
    set colorcolumn=80,100,120
    " highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
  endfunction
augroup END

augroup mutt
  " Mail
  autocmd BufRead,BufNewFile *mutt-* call SetMuttOptions()
  function SetMuttOptions()
    set filetype=mail
    set spell
    set colorcolumn=72
    set noundofile
    set formatoptions+=tcq
  endfunction
augroup END

augroup gemini
  autocmd FileType gmi call SetGeminiOptions()
  function SetGeminiOptions()
    set spell
  endfunction
augroup END

" BYOND DM
augroup dm
  autocmd FileType dm call SetDMOptions()
  function SetDMOptions()
    set colorcolumn=80,100,120
  endfunction
augroup END

" SQL settings
augroup sql
  autocmd FileType sql call SetSQLOptions()
  function SetSQLOptions()
    set colorcolumn=80,100,120
  endfunction
augroup END

" END: FileType Mappings

let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" From https://www.reddit.com/r/vim/comments/fwfue3/is_there_any_way_to_use_vim_keybindings_vimstyle/fmo3rhi?utm_source=share&utm_medium=web2x&context=3
" yank everything
nmap <leader>ya :%y+<CR>

" Crazy idea: disable arrow keys in normal mode
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

