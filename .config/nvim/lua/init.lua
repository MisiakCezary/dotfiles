vim.opt.completeopt = {'menu', 'menuone', 'noinsert'} -- 'noselect'
vim.opt.shortmess:append('c')

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
    if not lsp_completion then return end
    -- Insert lsp completions on type
    local keys = vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true)
    vim.api.nvim_feedkeys(keys, "normal", false)
  end,
})

-- Open diagnostic window when hovering
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float()
  end,
})

-- Disable diagnostic signs
vim.diagnostic.config({
  signs = false,
})

-- Auto activate treesitter
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*' },
  callback = function()
    pcall (function()
      vim.treesitter.start()
    end)
  end,
})

-- lsp's
vim.lsp.enable({"pylsp"})
vim.lsp.enable({"rust_analyzer"})
vim.lsp.enable({"lua_ls"})
