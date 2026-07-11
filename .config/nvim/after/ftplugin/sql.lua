vim.api.nvim_set_keymap('n', '<Space>W', '<Plug>(DBUI_SaveQuery)', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>E', '<Plug>(DBUI_EditBindParameters)', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Space>S', '<Plug>(DBUI_ExecuteQuery)', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Space>S', '<Plug>(DBUI_ExecuteQuery)', { noremap = true, silent = true})
