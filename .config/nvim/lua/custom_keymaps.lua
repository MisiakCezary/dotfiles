-- Keymaps
-- vim.api.nvim_set_keymap('n', '<C-f>', '<Esc>:grep -iIR "" **<C-Left><Left><Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-f>', '"9y:grep -iIR "<C-r>9" **<C-Left><Left><Left>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-p>', '<Esc>:find **/', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-p>', '"9y:find **/<C-r>9', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<Esc>:%s//gic<Left><Left><Left><Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-h>', '"9y:%s/<C-r>9//gic<Left><Left><Left><Left>', { noremap = true, silent = true })
vim.cmd('inoremap <expr> <Tab> pumvisible() ? "<C-y>" : "<Tab>"')
vim.cmd('inoremap <expr> <S-Tab> pumvisible() ? "<C-y>" : "<S-Tab>"')
-- Git integration
-- nnoremap <F2> :!git blame %<CR>
-- nnoremap <F3> :!git log --abbrev-commit %<CR>
