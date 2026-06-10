-- Blink CMP + lib + snippets
Core.add_plugin({
    { src = Core.gh('saghen/blink.lib'), version = 'main' },
    { src = Core.gh('saghen/blink.cmp'), version = 'main' },
    { src = Core.gh('Kaiser-Yang/blink-cmp-avante') },
    { src = Core.gh('rafamadriz/friendly-snippets'), version = 'main' },
})

-- Autocompletion
local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
    keymap = { preset = 'enter', ['<C-Space>'] = { 'show' } },
    sources = {
        default = { 'avante', 'snippets', 'lsp', 'path', 'buffer' },
        providers = {
            avante = {
                module = 'blink-cmp-avante',
                name = 'Avante',
                opts = {
                    -- options for blink-cmp-avante
                },
            },
        },
    },
})
