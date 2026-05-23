-- Blink CMP + lib + snippets
Core.add_plugin({
    { src = Core.gh('saghen/blink.lib'), version = 'main' },
    { src = Core.gh('saghen/blink.cmp'), version = 'main' },
    { src = Core.gh('rafamadriz/friendly-snippets'), version = 'main' },
})

-- Autocompletion
local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
    keymap = { preset = 'enter', ['<C-Space>'] = { 'show' } },
})
