return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = 'v0.11.0',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'super-tab',
                ['<CR>'] = { 'accept', 'fallback' },
            },

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
