if not vim.g.huge_buffer then
    vim.lsp.enable({"pylsp"})
    vim.lsp.enable({"rust_analyzer"})
    vim.lsp.enable({"lua_ls"})
end

vim.keymap.set('n', '<F12>', vim.lsp.buf.definition)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)

