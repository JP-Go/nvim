vim.cmd('set completeopt=menu,menuone')
local lspkind = require('lspkind')
local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
    },
    sources = {
        { name = 'calc' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
                path = '[Path]',
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                vsnip = '[Vsnip]',
                nvim_lua = '[Lua]',
                latex_symbols = '[Latex]',
            },
        }),
    },
})
