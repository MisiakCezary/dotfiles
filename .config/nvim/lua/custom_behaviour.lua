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

-- Autocomplete when typing
vim.api.nvim_create_autocmd("InsertCharPre", {
    pattern = "*",
    callback = function()
        -- No flickering
        if vim.fn.pumvisible() == 1 then return end
        -- No autocomplete after whitespace
        if string.match(vim.v.char, "%a") == nil then return end
        -- No autocomplete if no lsp connected
        local lsp_completion = vim.bo.omnifunc == 'v:lua.vim.lsp.omnifunc'
        if lsp_completion then
            -- Insert lsp completions on type
            local keys = vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
            vim.api.nvim_feedkeys(keys, "normal", false)
        else
            local key = vim.api.nvim_replace_termcodes("<C-n>", true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end
    end,
})

-- Enter accepts autocomplete in command mode
vim.keymap.set("c", "<CR>", function()
    if vim.fn.pumvisible() == 1 then
        return "<C-y>"
    end
    return "<CR>"
end, { expr = true })

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- cd into git root dir on vim launch
vim.cmd('silent cd `git rev-parse --show-toplevel`')
