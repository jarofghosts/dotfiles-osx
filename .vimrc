" ## PREFERENCES ##
syntax on
set t_Co=256
set background=dark
set autoindent
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
set hlsearch
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set nrformats=
autocmd BufRead,BufNewFile *.md setlocal spell
set shiftwidth=2
set softtabstop=2
set laststatus=2
colorscheme flatcolor
set expandtab
set backspace=indent,eol,start
" Mark 80 columns to prevent spillage
set colorcolumn=80
set nocompatible

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

" Syntastic checker
let g:syntastic_javascript_checkers=['jsl']
let g:syntastic_html_checkers=[]
let g:syntastic_ignore_files=['.*Projects\/personal\/.*']

" vim-airline
let g:airline_theme='wombat'
" remove unused modes
let g:airline_enable_fugitive=0
" set second section to filename
let g:airline_section_b="%f"
" empty third and fourth sections
let g:airline_section_c=""
let g:airline_section_x=""
" put filetype in fifth section
let g:airline_section_y="%Y"


" Paaaathogeeeennnn
execute pathogen#infect()
