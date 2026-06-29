vim.g.mapleader = ' '

vim.opt.completeopt = {'menu', 'menuone', 'noinsert'}
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'auto:1'
vim.opt.updatetime = 1200
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 2
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.path:append(',**') -- Better :find
vim.opt.wildignore = '*.exe,*.dll,*.pdb,*.log,*.pak,*.zip,*.rar,*.7z,*/tmp/*,*.so,.*swp,*.pyc,*.sqlite'
vim.g.netrw_banner = 0
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')
vim.opt.list = true
vim.opt.listchars = { tab='│-', trail='·', nbsp='␣', precedes='<', extends='>', leadmultispace='│   ' }
vim.opt.cursorline = true

