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
set wildignore=*.exe,*.dll,*.pdb,*.log,*.pak,*.zip,*.rar,*.7z

" Column for warnings/errors etc... " set scl
set signcolumn=yes

"" Colors!
syntax on
colorscheme vim
highlight Normal guibg=None
highlight SignColumn guibg=None
highlight LineNr guifg=#FFFFFF
highlight LineNrAbove guifg=#6A6A6A
highlight LineNrBelow guifg=#6A6A6A
highlight Pmenu guibg=#222222
highlight Pmenu guifg=#CCCCCC
highlight PmenuSel guifg=#222222
highlight Whitespace guifg=#DD5555
highlight NonText guifg=#9999DD
highlight StatusLine guibg=#222222
highlight StatusLine guifg=#DDDDDD
highlight StatusLineNC guibg=#222222
highlight StatusLineNC guifg=#DDDDDD
highlight CursorColumn guibg=#BBBBBB
highlight CursorColumn guifg=#222222

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

" (F)ind
nnoremap <C-f> :grep -iIR '' **<C-Left><Left><Left>
vnoremap <C-f> "9y:grep -iIR '<C-r>9' **<C-Left><Left><Left>

" (B)rowse for file
nnoremap <C-b> :e **/
vnoremap <C-b> "9y:e **/<C-r>9

" Classic Ctrl+h find and replace
nnoremap <C-h> :%s//gic<Left><Left><Left><Left>
vnoremap <C-h> "9y:%s/<C-r>9//gic<Left><Left><Left><Left>

" Quickfix list navigation
map <C-k> :cp<CR>
map <C-j> :cn<CR>
"map <F2> :copen<CR>

" Silently set directory to root git directory if found
silent cd `git rev-parse --show-toplevel`

" Fuzzy autocomplete
set completeopt+=fuzzy

" Statusbar with git
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=%{StatuslineGit()}
set statusline+=%#CursorColumn#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=%=%=%=%=%=%=%=
set statusline+=\ col:%c
set statusline+=\ ln:%l\/%L
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %#StatusLine#
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ 
"set statusline+=\ %p%%
