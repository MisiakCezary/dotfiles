-- Launch theme
vim.o.background = 'light'
require('vscode').setup({
    style = 'light',
    transparent = true,
    underline_links = true,
})
vim.cmd.colorscheme 'vscode'
