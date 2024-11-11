return {
    {
        'echasnovski/mini.files',
        version = '*',
        dependencies = { { 'echasnovski/mini.icons', opts = {} } },
        config = {
            mappings = {
                go_in_plus = '<CR>',
            },
        },
        keys = {
            {
                '<leader>e',
                function()
                    require('mini.files').open()
                end,
                desc = 'Open file navigator',
            },
        },
    },
}
