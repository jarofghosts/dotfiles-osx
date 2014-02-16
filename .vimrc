" Paaaathogeeeennnn
execute pathogen#infect()

" ## PREFERENCES ##
filetype plugin on
filetype indent on
syntax on

set background=dark
" take that, vi
set nocompatible
set autoindent
" reload files changed outside vim
set autoread
" "smart"indent :|
set smartindent
set encoding=utf8
set backupdir=~/tmp
" </3 .swp
set noswapfile
" i dunno, just in case
set cryptmethod=blowfish
set number
set history=500
set wildmenu
set wildmode=full
" don't need mode with airline
set noshowmode
" highlight search terms
set hlsearch
" maintain undo levels between buffer closings
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
" i dont like to capitalize
set spellcapcheck=
" treat numbers like humans treat numbers
set nrformats=
" uh huh
set shiftwidth=2
set softtabstop=2
set laststatus=2
set expandtab
set backspace=indent,eol,start
" mark 80 columns to prevent spillage
set colorcolumn=80
" do the magic search thing
set incsearch

" turn spellcheck on for markdown and rst files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
" autoclose fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" wombat is good.
colorscheme wombat256i

" ## MAPPINGS ##

" allow c-p and c-n to do command filtering
cnoremap <c-p> <up>
cnoremap <c-n> <down>
" remap ctrl+l to un-highlight search results
noremap <silent> <c-l> :nohls<cr><c-l>
" ctrl+j scrolls down, ctrl+k scrolls up
noremap <c-j> <c-e>
noremap <c-k> <c-y>
" . works in visual mode as it should
vnoremap . :normal .<cr>
" space as leader, just crazy enough to work
let mapleader=" "
let g:mapleader=" "
" fugitive remaps
noremap <leader>b :Gbrowse<cr>
noremap <leader>d :Gdiff<cr>
noremap <leader>l :Gblame<cr>
" g creates new secret gist
noremap <leader>g :Gist<cr>
" D toggles gitgutter
noremap <leader>D :GitGutterToggle<cr>
" p creates new pasttle
noremap <leader>p :Pasttle<cr>
" f opens file
noremap <leader>f gf
" F opens file in new vertical split
noremap <leader>F :vertical wincmd f<cr> 

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

vmap <expr> <left>   DVB_Drag('left')  
vmap <expr> <right>  DVB_Drag('right') 
vmap <expr> <down>   DVB_Drag('down')  
vmap <expr> <up>     DVB_Drag('up')    
vmap <expr> D        DVB_Duplicate()   

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

" indent html tags
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" vim-gist
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" use github-flavored markdown syntax highlighting
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Syntastic checker
let g:syntastic_javascript_checkers=['jsl']
let g:syntastic_html_checkers=[]
" syntastic is just for work
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

" wombat is good
let g:airline_theme='wombat'
