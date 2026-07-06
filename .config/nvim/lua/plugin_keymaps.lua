-- Debug keymaps
vim.api.nvim_set_keymap('n', '<F5>', '<Esc>:DapContinue<CR>:DapViewOpen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F17>', '<Esc>:DapDisconnect<CR>:DapViewClose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', '<Esc>:DapToggleBreakpoint<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', '<Esc>:DapStepOver<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', '<Esc>:DapStepInto<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F23>', '<Esc>:DapStepOut<CR>', { noremap = true, silent = true})

-- Telescope remaps
vim.api.nvim_set_keymap('n', '<F2>', '<Esc>:Telescope builtin<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>exec 'Telescope live_grep'<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-f>', "\"9y<cmd>exec 'Telescope live_grep default_text=' . escape(@9, ' ')<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-s>', "<cmd>exec 'Telescope find_files'<CR>", { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gs', "<cmd>exec 'Telescope git_status'<CR>", { noremap = true, silent = true})

-- Lsp remaps
local function lsp_definition_with_fallback()
    -- Build position parameters based on current cursor placement
    local params = vim.lsp.util.make_position_params(0, 'utf-8')
    vim.lsp.buf_request(0, 'textDocument/definition', params, function(_, def_ref)
        if def_ref then
            vim.lsp.buf.definition()
        else
            require('telescope.builtin').live_grep({
                default_text = "\\w+\\s+" .. vim.fn.expand("<cword>") .."\\s*(\\(|:|\\n)"
            })
        end
    end)
end

vim.keymap.set('n', '<F12>', lsp_definition_with_fallback)
vim.keymap.set('n', 'gd', lsp_definition_with_fallback)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

