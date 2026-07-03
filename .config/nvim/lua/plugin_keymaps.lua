-- Dadbod keymaps
vim.api.nvim_set_keymap('n', '<F2>', '<Esc>:tabnew<CR>:DBUI<CR>', { noremap = true, silent = true})

-- Debug keymaps
vim.api.nvim_set_keymap('n', '<F3>', '<Esc>:DapViewToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F4>', '<Esc>:DapDisconnect<CR>:DapViewClose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F5>', '<Esc>:DapContinue<CR>:DapViewOpen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F6>', '<Esc>:DapStepOver<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F7>', '<Esc>:DapStepOut<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F8>', '<Esc>:DapStepInto<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', '<Esc>:DapToggleBreakpoint<CR>', { noremap = true, silent = true})

-- Telescope remaps
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>exec 'Telescope live_grep'<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-f>', "\"9y<cmd>exec 'Telescope live_grep default_text=' . escape(@9, ' ')<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Tab>', "<cmd>exec 'Telescope find_files'<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', "<cmd>exec 'Telescope git_status'<CR>", { noremap = true, silent = true})

