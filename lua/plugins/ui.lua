return {
    { 'j-hui/fidget.nvim', opts = {} },
    { 'blazkowolf/gruber-darker.nvim' },
    { 'loctvl842/monokai-pro.nvim' },
    { 'miikanissi/modus-themes.nvim', priority = 1000 },
    {
        'sainnhe/gruvbox-material',
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_foreground = 'material'
        end,
    },
    { 'savq/melange-nvim' },
    { 'echasnovski/mini.indentscope', version = '*', config = true },
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    { 'mode', separator = { left = '' }, right_padding = 2 },
                },
                lualine_b = { 'filename', 'branch' },
                lualine_c = {
                    '%=', --[[ add your center components here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        },
    },
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false },
    },
    {
        'akinsho/bufferline.nvim',
        config = true,
        lazy = false,
        keys = {
            { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
            { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
            { '<leader>bc', '<Cmd>bdelete<CR>', desc = 'Close buffer' },
        },
    },
    {
        'stevearc/dressing.nvim',
        config = true,
    },
}
