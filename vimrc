
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'calviken/vim-gdscript3'
Plug 'geverding/vim-hocon'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'andlrc/rpgle.vim'
Plug 'https://tildegit.org/sloum/gemini-vim-syntax'
Plug 'tweekmonster/startuptime.vim'
Plug 'ctrlpvim/ctrlp.vim'
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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


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

" Limelight config for unknown colour schemes

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'


" Goyo customisation for distraction free writing
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999 " Will make lines centre
  set virtualedit=all
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
  set virtualedit=
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

augroup latex
  autocmd FileType tex call SetLatexOptions()
  function SetLatexOptions()
    set colorcolumn=80
    set virtualedit=all
    set textwidth=79
    set spell
    "Limelight
  endfunction
augroup END

let g:vimwiki_list = [{'path': '~/.vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]

let g:vimwiki_ext2syntax = {'.wiki': 'media'}
"let g:vimwiki_global_ext = 0

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

" From https://www.reddit.com/r/vim/comments/fwfue3/is_there_any_way_to_use_vim_keybindings_vimstyle/fmo3rhi?utm_source=share&utm_medium=web2x&context=3
" yank everything
nmap <leader>ya gg0vG$"+y
