vim.bo.textwidth = 80
vim.opt.spell = true
vim.opt.spelllang = vim.opt.spelllang + 'en'

local cmp = require('cmp')
cmp.setup.buffer({
    sources = {
        { name = 'calc' },
        { name = 'nvim_lsp', keyword_length = 2 },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },
})
