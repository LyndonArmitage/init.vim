
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
Plug 'plasticboy/vim-markdown'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'roxma/vim-paste-easy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'geverding/vim-hocon'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" Airline
let g:airline_powerline_fonts = 1

" NERDTree
map <F4> :NERDTreeToggle<CR>

" vim markdown-config
let g:vim_markdown_folding_disabled = 1

" Specific markdown file settings
augroup markdown
	autocmd FileType markdown,md call SetMarkdownOptions()
	function SetMarkdownOptions()
		set colorcolumn=80,100,120
		set textwidth=79
    set spell
    set formatoptions+=tcq
    " IndentLine ovverrides conceallevel
    let g:indentLine_enabled=0
    let g:vim_markdown_conceal = 0
    set conceallevel=0
	endfunction
augroup END

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

augroup git
  autocmd FileType gitcommit call SetGitOptions()
  function SetGitOptions()
    set noundofile
    set colorcolumn=72,80
    set textwidth=79
  endfunction
augroup END


augroup greyscript
	autocmd FileType greyscript call SetGreyScriptOptions()
	function SetGreyScriptOptions()
		set colorcolumn=80,100,120
    highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
	endfunction
augroup END
au BufRead,BufNewFile *.src set filetype=greyscript

augroup c
  autocmd FileType c call SetCOptions()
  autocmd FileType cpp call SetCOptions()
  function SetCOptions()
    set colorcolumn=80,100,120
    " highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
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

augroup rpgle
  autocmd FileType rpgle call SetRPGOptions()
  function SetRPGOptions()
    set colorcolumn=6,100
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
    "set colorcolumn=80
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

