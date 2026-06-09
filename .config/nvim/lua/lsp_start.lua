if not vim.g.huge_buffer then
    vim.lsp.enable({"pylsp"})
    vim.lsp.enable({"rust_analyzer"})
    vim.lsp.enable({"lua_ls"})
end
