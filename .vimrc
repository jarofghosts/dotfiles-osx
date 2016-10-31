" Paaaathogeeeennnn
execute pathogen#infect()
" ## PREFERENCES ##
filetype plugin on
filetype indent on
set conceallevel=2
set concealcursor=nc
set noshowmode
set suffixesadd=.js
set termguicolors
syntax on

set lazyredraw
set background=dark
set autoindent
" reload files changed outside vim
set autoread
" "smart"indent :|
set smartindent
set encoding=utf8
set backupdir=~/tmp
set ofu=syntaxcomplete#Complete
" </3 .swp
set noswapfile
" i dunno, just in case
set number
set history=1000
set wildmenu
set wildmode=full
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

" enable omnicompletion for some filetypes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" turn on html syntax for ract files
autocmd BufNewFile,BufRead *.ract set filetype=mustache
" turn spellcheck on for markdown and rst files
autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
" use open for Gbrowse in fugitive
command! -bar -nargs=1 Browse silent! exe '!open' shellescape(<q-args>, 1)

" fenced code blocks in markdown files
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html']

colorscheme molokai

" ## MAPPINGS ##

" left and right arrows navigate buffers
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
" up and down navigate jump list
nnoremap <up> <c-o>
nnoremap <down> <c-i>
" allow c-p and c-n to do command filtering
cnoremap <c-p> <up>
cnoremap <c-n> <down>
" remap ctrl+l to un-highlight search results
noremap <silent> <c-l> :nohls<cr><c-l>
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
" P creates new pasttle
noremap <leader>P :Pasttle<cr>
" u opens url
noremap <leader>u gx
" f opens file
noremap <leader>f gf
" F opens file in new vertical split
noremap <leader>F :vertical wincmd f<cr> 
" T runs npm test
noremap <leader>T :sp<cr><c-w>j:terminal<cr>npm run test-file<cr>
noremap <leader>t :let @" = expand("%:p")<cr>:sp<cr><c-w>j:terminal<cr>npm test <c-\><c-n>pi<cr>
" y yanks into system clipboard
vmap <leader>y "*y
" p pastes from system clipboard
nmap <leader>p o<esc>"*p

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "node_modules/"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:agprg="ag --nogroup --nocolor --ignore '*.min.*' --column"

" ## PLUGINS ##

" indent html tags
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" vim-gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" align sub-forms in a pretty way
let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1

let g:javascript_double_literal_indent=1

let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_python_enabled_makers = ['flake8']
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1

let g:rainbow_active = 1

hi StatusLine term=reverse ctermfg=232 ctermbg=1
" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermfg=1 ctermbg=232
  au InsertLeave * hi StatusLine term=reverse ctermfg=232 ctermbg=1
endif

let g:airline#extensions#whitespace#checks = []
let g:airline#extensions#whitespace#trailing_format = ''

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
    let g:airline_section_b = airline#section#create_left(['hunks'])
    let g:airline_section_c = airline#section#create(['%f'])
    let g:airline_section_x = airline#section#create(['branch'])
    let g:airline_section_y = airline#section#create(['filetype'])
endfunction

autocmd VimEnter * call AirlineInit()
autocmd! BufWritePost,BufEnter * Neomake
let g:deoplete#enable_at_startup = 1
