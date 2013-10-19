" ## PREFERENCES ##
syntax on
set t_Co=256
set background=dark
set autoindent
set encoding=utf8
set number
set hlsearch
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set shiftwidth=2
set softtabstop=2
set laststatus=2
colorscheme Tomorrow-Night-Bright
set expandtab
set backspace=indent,eol,start
" Mark 80 columns to prevent spillage
set colorcolumn=80
set nocompatible

" ## MAPPINGS ##

" Remap ;a to take me out of insert mode without reaching for <Esc>
inoremap ;a <Esc>
" Remap ;s to save buffer and keep me in insert
inoremap ;s <Esc>:w<cr>i
" Remap CTRL+L to un-highlight search results
noremap <silent> <c-l> :nohls<cr><c-l>
" CTRL+J scrolls down, CTRL+K scrolls up
noremap <c-j> <c-e>
noremap <c-k> <c-y>
" . works in visual mode as it should
vnoremap . :normal .<cr>

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
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
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
