-- Debug keymaps
vim.api.nvim_set_keymap('n', '<M-c>', '<Esc>:DapContinue<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-d>', '<Esc>:DapDisconnect<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-q>', '<Esc>:DapStepOut<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-o>', '<Esc>:DapStepOver<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-i>', '<Esc>:DapStepInto<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-b>', '<Esc>:DapToggleBreakpoint<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-v>', '<Esc>:DapViewToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-w>', '<Esc>:DapViewWatch<CR>', { noremap = true, silent = true})

-- Telescope remaps
vim.keymap.set('n', '<C-f>', "<cmd>exec 'Telescope live_grep'<CR>")
vim.keymap.set('v', '<C-f>', "\"9y<cmd>exec 'Telescope live_grep default_text=' . escape(@9, ' ')<CR>")
vim.keymap.set('n', '<C-p>', "<cmd>exec 'Telescope find_files'<CR>")
vim.keymap.set('v', '<C-p>', "\"9y<cmd>exec 'Telescope find_files default_text=' . escape(@9, ' ')<CR>")
vim.keymap.set('n', '<C-Space>', "<cmd>exec 'Telescope'<CR>")
