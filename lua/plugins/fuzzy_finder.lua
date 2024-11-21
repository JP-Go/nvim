return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-fzy-native.nvim',
    },
    cmd = { 'Telescope' },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            pickers = {
                find_files = {
                    find_command = { 'rg', '--files', '--hidden', '--ignore', '--glob', '!**/.git/*' },
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                    },
                },
            },
        })
        telescope.load_extension('fzy_native')
    end,
    keys = {
        { '<leader>fb', '<cmd>Telescope buffers<cr>', 'Find buffers' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', 'Find files' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', 'Find gelp' },
        { '<leader>fw', '<cmd>Telescope live_grep<cr>', 'Find word' },
    },
}
