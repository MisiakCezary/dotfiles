require('blink.cmp').setup({
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        per_filetype = {
            sql = { 'snippets', 'dadbod', 'buffer' },
            mysql = { 'snippets', 'dadbod', 'buffer' },
            plsql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
            dadbod = {
                name = 'Dadbod',
                module = 'vim_dadbod_completion.blink',
                score_offset = 85,
            }
        }
    },
    keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },
    },
    signature = {
        enabled = true,
        window = {
            border = 'single',
        }
    }
})
