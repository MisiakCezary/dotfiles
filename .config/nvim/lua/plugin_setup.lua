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
Plug('tpope/vim-fugitive', { commit = '3b753cf8c6a4dcde6edee8827d464ba9b8c4a6f0'})
vim.call('plug#end')

-- Start mason
require("mason").setup()
require("mason-nvim-dap").setup()
require("mason-lspconfig").setup()
require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

-- Disable diagnostic signs
vim.diagnostic.config({ signs = false, })

-- Telescope setup
require('telescope').setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        width = { padding = 0 },
        height = { padding = 0 },
        preview_width = 0.6,
      },
    },
  },
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

-- Launch theme
vim.cmd('let g:codedark_transparent = 1')
vim.cmd('colorscheme codedark')
