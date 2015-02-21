" Paaaathogeeeennnn
execute pathogen#infect()

" ## PREFERENCES ##
filetype plugin on
filetype indent on
syntax on

set lazyredraw
set ttyfast
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
set ofu=syntaxcomplete#Complete
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

" enable omnicompletion for some filetypes
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" turn on html syntax for ract files
autocmd BufNewFile,BufRead *.ract set filetype=html
" turn spellcheck on for markdown and rst files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
" autoclose fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
" use open for Gbrowse in fugitive
command! -bar -nargs=1 Browse silent! exe '!open' shellescape(<q-args>, 1)

" dracula is good.
colorscheme dracula

" ## MAPPINGS ##

" left and right arrows navigate buffers
nnoremap <left> :bp<cr>
nnoremap <right> :bn<cr>
" set a mark before a search for easy jumping back
nnoremap / ml/
nnoremap ? ml?
" allow c-p and c-n to do command filtering
cnoremap <c-p> <up>
cnoremap <c-n> <down>
" remap ctrl+l and ctrl+h to swap panes
noremap <silent> <c-h> :wincmd h<cr>
noremap <silent> <c-l> :wincmd l<cr>
" remap ctrl+i to un-highlight search results
noremap <silent> <c-i> :nohls<cr><c-i>
" ctrl+j activates :Ag
noremap <c-j> :Ag 
" . works in visual mode as it should
vnoremap . :normal .<cr>
" space as leader, just crazy enough to work
let mapleader=" "
let g:mapleader=" "
" syntastic remaps
noremap <leader>, :lprev<cr>
noremap <leader>. :lnext<cr>
" fugitive remaps
noremap <leader>b :Gbrowse<cr>
noremap <leader>d :Gdiff<cr>
noremap <leader>l :Gblame<cr>
" g creates new secret gist
noremap <leader>g :Gist<cr>
" D toggles gitgutter
noremap <leader>D :GitGutterToggle<cr>
" p creates new pasttle
noremap <leader>P :Pasttle<cr>
" u opens url
noremap <leader>u gx
" f opens file
noremap <leader>f gf
" F opens file in new vertical split
noremap <leader>F :vertical wincmd f<cr> 
" T runs npm test
noremap <leader>T :!npm test<cr>
" y yanks into system clipboard
vmap <leader>y "+y
" p pastes from system clipboard
nmap <leader>p "+p
" switch var statement with next var
nmap <leader>s ddpcw  ,<esc>kvhhcvar<esc>

" neocomplete
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "node_modules/"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:agprg="ag --nogroup --nocolor --ignore node_modules/ --ignore '*.min.*' --column"

" ## PLUGINS ##

" conceal JS stuffs
let g:javascript_conceal = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" overwrite complete function
let g:neocomplete#force_overwrite_completefunc = 1

" indent html tags
let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" vim-gist
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" use github-flavored markdown syntax highlighting
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" align sub-forms in a pretty way
let g:clojure_align_subforms = 1
let g:clojure_align_multiline_strings = 1

" Syntastic checker
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_args='--config ~/Projects/UA/ua-style/config.json --rulesdir ~/Projects/UA/ua-style/lib/rules'
let g:syntastic_html_checkers=[]

" vim-airline
let g:airline#extensions#whitespace#enabled = 0
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

let g:airline_theme='tomorrow'

au BufEnter *.js set conceallevel=1
