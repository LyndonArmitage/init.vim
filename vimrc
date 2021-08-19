
" Automatic install of plug if it does not exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle') " Using same dir as Vundle
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'rhysd/vim-grammarous'
Plug 'roxma/vim-paste-easy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tweekmonster/startuptime.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
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

" coc.vim settings
" Most of these have come from the example

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Give more space for displaying messages.
set cmdheight=2


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

augroup c
  autocmd FileType c call SetCOptions()
  autocmd FileType cpp call SetCOptions()
  function SetCOptions()
    set colorcolumn=80,100,120
    " highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
  endfunction
augroup END

" Limelight config for unknown colour schemes

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'


" Goyo customisation for distraction free writing
let g:goyo_width = 120
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999 " Will make lines centre
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=0
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

augroup latex
  autocmd FileType tex call SetLatexOptions()
  function SetLatexOptions()
    set colorcolumn=80
    set textwidth=79
    set formatoptions+=tcq
    set spell
    "Limelight
  endfunction
augroup END

" SQL settings
augroup sql
  autocmd FileType sql call SetSQLOptions()
  function SetSQLOptions()
    set colorcolumn=80,100,120
  endfunction
augroup END

" From https://www.reddit.com/r/vim/comments/fwfue3/is_there_any_way_to_use_vim_keybindings_vimstyle/fmo3rhi?utm_source=share&utm_medium=web2x&context=3
" yank everything
nmap <leader>ya :%y+<CR>

" Crazy idea: disable arrow keys in normal mode
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

