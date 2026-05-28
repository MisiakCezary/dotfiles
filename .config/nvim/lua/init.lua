require('options')
require('big_file')
require('plugin_setup')
pcall(function() require('dap_configs') end) -- Source manually to get errors
require('plugin_keymaps')
require('theme')
require('custom_behaviour')
require('custom_keymaps')
require('lsp_start')

