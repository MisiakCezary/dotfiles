vim.opt.completeopt = {'menu', 'menuone', 'noinsert'} -- 'noselect'
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'auto:1'
vim.opt.updatetime = 1200

-- Disable heavy operations in huge buffers
vim.g.huge_buffer = false
vim.api.nvim_create_autocmd( {'BufReadPost', "FileReadPre"}, {
  pattern = { '*' },
  callback = function()
    local path = vim.fn.expand('%')
    local size = vim.fn.getfsize(path)
    if size > 512 * 1024 then
      vim.g.huge_buffer = true
      vim.cmd('syntax off')
      vim.cmd('filetype off')
      vim.cmd('set noundofile')
      vim.cmd('set noswapfile')
      vim.cmd('set eventignore=all')
    end
  end,
})

-- Plugin list
local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug('airblade/vim-gitgutter', { commit = '21c977e8597c468c7dc76001389b0b430d46a4b0'})
Plug('nvim-treesitter/nvim-treesitter', { commit = '4916d6592ede8c07973490d9322f187e07dfefac'})
Plug('mfussenegger/nvim-dap', { commit = '45a69eba683a2c448dd9ecfc4de89511f0646b5f'})
Plug('igorlfs/nvim-dap-view', { commit = '1dd4ba2307245ca9517a4b9d99f3bf80830e4397'})
Plug('mfussenegger/nvim-dap-python', { commit = '1808458eba2b18f178f990e01376941a42c7f93b'})
vim.call('plug#end')

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
if not vim.g.huge_buffer then
  vim.lsp.enable({"pylsp"})
  vim.lsp.enable({"rust_analyzer"})
  vim.lsp.enable({"lua_ls"})
end
