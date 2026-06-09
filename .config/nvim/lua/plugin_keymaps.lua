-- Debug keymaps
vim.api.nvim_set_keymap('n', '<F3>', '<Esc>:DapViewToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F4>', '<Esc>:DapDisconnect<CR>:DapViewClose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F5>', '<Esc>:DapContinue<CR>:DapViewOpen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', '<Esc>:DapStepOver<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F7>', '<Esc>:DapStepOut<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F8>', '<Esc>:DapStepInto<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', '<Esc>:DapToggleBreakpoint<CR>', { noremap = true, silent = true})

-- Telescope remaps
vim.keymap.set('n', '<C-f>', "<cmd>exec 'Telescope live_grep'<CR>")
vim.keymap.set('v', '<C-f>', "\"9y<cmd>exec 'Telescope live_grep default_text=' . escape(@9, ' ')<CR>")
vim.keymap.set('n', '<C-p>', "<cmd>exec 'Telescope find_files'<CR>")
vim.keymap.set('v', '<C-p>', "\"9y<cmd>exec 'Telescope find_files default_text=' . escape(@9, ' ')<CR>")
vim.keymap.set('n', '<C-Space>', "<cmd>exec 'Telescope'<CR>")
