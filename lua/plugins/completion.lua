return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',

        config = function()
            if vim.version.lt(vim.version(), { 0, 11, 0 }) then
                require('blink.cmp').setup({
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
                })
            else
                return
            end
        end,
    },
}
