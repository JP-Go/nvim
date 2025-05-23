return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets', 'Kaiser-Yang/blink-cmp-avante' },
        version = '1.*',

        opts = {
            sources = {
                default = {
                    'avante',
                    'lsp',
                    'path',
                    'luasnip',
                    'buffer',
                },
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
            keymap = { preset = 'enter' },
            completion = {
                menu = { border = 'single' },
                list = {
                    selection = {
                        preselect = function(ctx)
                            return ctx.mode ~= 'cmdline'
                        end,
                        auto_insert = true,
                    },
                },
                documentation = {
                    window = { border = 'single' },
                },
            },
            signature = { enabled = true, window = { border = 'single' } },
        },
    },
}
