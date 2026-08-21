vim.api.nvim_set_keymap('n', '<F5>', '<Esc>:DapContinue<CR>:DapViewOpen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F17>', '<Esc>:DapDisconnect<CR>:DapViewClose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', '<Esc>:DapToggleBreakpoint<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', '<Esc>:DapStepOver<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', '<Esc>:DapStepInto<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F23>', '<Esc>:DapStepOut<CR>', { noremap = true, silent = true})

require('dap-view').setup({
    winbar = {
        default_section = 'repl',
        sections = {
            'repl',
            'scopes',
            'threads',
            'exceptions',
            'breakpoints',
            'watches',
        },
    },
})
