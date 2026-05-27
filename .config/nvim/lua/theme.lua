-- Launch theme
vim.o.background = 'light'
require('vscode').setup({
    style = 'light',
    transparent = true,
    italic_comments = true,
    italic_inlayhints = true,
    underline_links = true,
})
vim.cmd.colorscheme 'vscode'
