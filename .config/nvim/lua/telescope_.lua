require('telescope').setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        borderchars = { '', '', '', '', '', '', '', '' },
        layout_config = {
            prompt_position = 'top',
            horizontal = {
                width = { padding = 0 },
                height = { padding = 0 },
                preview_width = 0.6,
            },
        },
    },
})

vim.api.nvim_set_keymap('n', '<F2>', '<Esc>:Telescope builtin<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>exec 'Telescope live_grep'<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-f>', "\"9y<cmd>exec 'Telescope live_grep default_text=' . escape(@9, ' ')<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-s>', "<cmd>exec 'Telescope find_files'<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', "<cmd>exec 'Telescope git_status'<CR>", { noremap = true, silent = true})

