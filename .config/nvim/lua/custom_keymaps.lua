-- Keymaps
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '+', '<esc>4<C-W>><C-W>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', '<esc>4<C-W><<C-W>-', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gb', ":let @9 = line('.')<CR>:enew<CR>:0r!git blame #<CR>:<C-r>9<CR>zz:setlocal readonly<CR>:setlocal nomodified<CR>", { noremap = true, silent = true})
