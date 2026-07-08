local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        local line = mark[1]
        local ft = vim.bo.filetype
        if line > 0 and line <= lcount
            and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
            and not vim.o.diff then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- Open xaml files as xml
vim.filetype.add({
    extension = {
        xaml = "xml",
    },
})

-- Disable diagnostic signs
vim.diagnostic.config({
    signs = false,
    float = {
        border = 'double',
        header = false,
        focusable = true,
    }
})

-- Keep visual selection while indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true})

-- Resize window using +/-
vim.api.nvim_set_keymap('n', '+', '<esc>4<C-W>><C-W>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', '<esc>4<C-W><<C-W>-', { noremap = true, silent = true})

-- [G]it [B]lame
vim.api.nvim_set_keymap('n', 'gb', ":let @9 = line('.')<CR>:enew<CR>:0r!git blame #<CR>:<C-r>9<CR>zz:setlocal readonly<CR>:setlocal nomodified<CR>:bd", { noremap = true, silent = true})

-- cd into git root dir on vim launch
vim.cmd('silent cd `git rev-parse --show-toplevel`')

