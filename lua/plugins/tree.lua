return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = true,
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    keys = {
        { '<leader>e', '<cmd>Oil<CR>', desc = 'Open file navigator' },
    },
}
