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
Plug('tomasiser/vim-code-dark', { commit = '4624dc223bf574aa9a731c2383c579847303c380'})
Plug('airblade/vim-gitgutter', { commit = '21c977e8597c468c7dc76001389b0b430d46a4b0'})
Plug('nvim-treesitter/nvim-treesitter', { commit = '4916d6592ede8c07973490d9322f187e07dfefac'})
Plug('mason-org/mason.nvim', { commit = '12ddd182d9efbdc848b540f16484a583d52da0fb'})
Plug('mfussenegger/nvim-dap', { commit = '45a69eba683a2c448dd9ecfc4de89511f0646b5f'})
Plug('mason-org/mason-lspconfig.nvim', { commit = '0c2823e0418f3d9230ff8b201c976e84de1cb401'})
Plug('jay-babu/mason-nvim-dap.nvim', { commit = '9a10e096703966335bd5c46c8c875d5b0690dade'})
Plug('igorlfs/nvim-dap-view', { commit = '1dd4ba2307245ca9517a4b9d99f3bf80830e4397'})
Plug('mfussenegger/nvim-dap-python', { commit = '1808458eba2b18f178f990e01376941a42c7f93b'})
Plug('nvim-lua/plenary.nvim', { commit = '74b06c6c75e4eeb3108ec01852001636d85a932b'})
Plug('nvim-telescope/telescope.nvim', { commit = '506338434fec5ad19cb1f8d45bf92d66c4917393'})
vim.call('plug#end')

-- Start mason
require("mason").setup()
require("mason-nvim-dap").setup()
require("mason-lspconfig").setup()
require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

-- Debug keymaps
vim.api.nvim_set_keymap('n', '<M-c>', '<Esc>:DapContinue<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-d>', '<Esc>:DapDisconnect<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-q>', '<Esc>:DapStepOut<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-o>', '<Esc>:DapStepOver<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-i>', '<Esc>:DapStepInto<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-b>', '<Esc>:DapToggleBreakpoint<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-v>', '<Esc>:DapViewToggle<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<M-w>', '<Esc>:DapViewWatch<CR>', { noremap = true, silent = true})

-- Telescope remaps
vim.api.nvim_set_keymap('n', '<C-p>', '<Esc>:lua require"telescope.builtin".find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-p>', '"9y:lua require"telescope.builtin".find_files({ default_text = "<C-r>9", find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<Esc>:lua require"telescope.builtin".live_grep()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-f>', '"9y:lua require"telescope.builtin".live_grep({ default_text = "<C-r>9" })<CR>', { noremap = true, silent = true })

-- Launch theme
vim.cmd('colorscheme codedark')

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
