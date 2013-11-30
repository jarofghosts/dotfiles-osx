" Paaaathogeeeennnn
execute pathogen#infect()

" ## PREFERENCES ##
syntax on
set t_Co=256
set background=dark
set autoindent
set autoread
set smartindent
filetype plugin on
set encoding=utf8
set backupdir=~/tmp
set noswapfile
set cryptmethod=blowfish
set number
set history=200
set wildmenu
set wildmode=full
set noshowmode
set hlsearch
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
" i dont like to capitalize
set spellcapcheck=
" treat numbers like humans treat numbers
set nrformats=
" turn spellcheck on for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell
" autoclose fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
set shiftwidth=2
set softtabstop=2
set laststatus=2
colorscheme flatcolor
set expandtab
set backspace=indent,eol,start
" Mark 80 columns to prevent spillage
set colorcolumn=80
set nocompatible
set incsearch


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" ## MAPPINGS ##

" Remap ;a to take me out of insert mode without reaching for <Esc>
inoremap ;a <Esc>
" Remap ;s to save buffer
inoremap ;s <Esc>:w<cr>
" Remap CTRL+L to un-highlight search results
noremap <silent> <c-l> :nohls<cr><c-l>
" CTRL+J scrolls down, CTRL+K scrolls up
noremap <c-j> <c-e>
noremap <c-k> <c-y>
" . works in visual mode as it should
vnoremap . :normal .<cr>
" , as leader
let mapleader = ","
let g:mapleader = ","
" fugitive remaps
noremap <Leader>w :Gwrite<cr>
noremap <Leader>s :Gstatus<cr>
noremap <Leader>c :Gcommit<cr>
noremap <Leader>a :Gcommit -a<cr>
noremap <Leader>b :Gbrowse<cr>
noremap <Leader>d :Gdiff<cr>
noremap <Leader>l :Gblame<cr>
noremap <Leader>o :ls<cr>:b

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ## PLUGINS ##

" Visual block drag plugin + settings,
" select block and then move it with arrow keys, or
" create a movable duplicate with D
runtime plugin/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')  
vmap  <expr>  <RIGHT>  DVB_Drag('right') 
vmap  <expr>  <DOWN>   DVB_Drag('down')  
vmap  <expr>  <UP>     DVB_Drag('up')    
vmap  <expr>  D        DVB_Duplicate()   

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" vim-gist
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Syntastic checker
let g:syntastic_javascript_checkers=['jsl']
let g:syntastic_html_checkers=[]
let g:syntastic_ignore_files=['.*Projects\/personal\/.*']

" vim-airline
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline_theme='wombat'
