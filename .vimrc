" Ignore case sensitivity while searching " set ic
set ignorecase

" Highlight found text while searching " set hls
set hlsearch

" Top/Bottom margin when scrolling
set scrolloff=2

" Incremental search for vanilla vim " set inc
set incsearch

" Add line numbers and make them relative " set nu / rnu
set number
set relativenumber

" Don't wrap lines longer than window width
set nowrap

" Set tab as 4 spaces wide
set shiftwidth=4 smarttab
set expandtab
"set tabstop=4 softtabstop=0

" Ignore searching file extentions
set wildignore=*.exe,*.dll,*.pdb,*.log,*.pak,*.zip,*.rar,*.7z,*/tmp/*,*.so,.*swp,*.pyc,*.sqlite

"" Colors!
colorscheme codedark

" Disable explorer banner
let g:netrw_banner=0

" Mouse interaction, can resize splits
set mouse=a

" Share system clipboard with default one 
set clipboard+=unnamedplus

" Display whitespaces
set list
set listchars=tab:\ »\ ,trail:·,nbsp:␣
set listchars+=precedes:<,extends:>

" VSCode default Ctrl+f
nnoremap <C-f> :grep -iIR '' **<C-Left><Left><Left>
vnoremap <C-f> "9y:grep -iIR '<C-r>9' **<C-Left><Left><Left>

" VSCode default Ctrl+p
nnoremap <C-p> :e **/
vnoremap <C-p> "9y:e **/<C-r>9

" VSCode default Ctrl+h
nnoremap <C-h> :%s//gic<Left><Left><Left><Left>
vnoremap <C-h> "9y:%s/<C-r>9//gic<Left><Left><Left><Left>

" Quickfix list navigation
map <C-k> :cp<CR>
map <C-j> :cn<CR>

" Git integration
nnoremap <F2> :!git blame %<CR>
nnoremap <F3> :!git log --abbrev-commit %<CR>

" Silently set directory to root git directory if found
silent cd `git rev-parse --show-toplevel`

