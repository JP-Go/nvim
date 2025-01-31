return {
    { 'echasnovski/mini.surround', version = '*', config = true },
    { 'echasnovski/mini.pairs', version = '*', config = true },
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require('toggleterm').setup({
                open_mapping = [[<c-\>]],
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = {
                    'c',
                    'lua',
                    'vim',
                    'vimdoc',
                    'query',
                    'sql',
                    'bash',
                    'javascript',
                    'typescript',
                    'css',
                    'html',
                    'tsx',
                    'vue',
                    'prisma',
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        config = true,
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesitter-context').setup()
        end,
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
        opts = {},
    },
    {
        'jiaoshijie/undotree',
        dependencies = 'nvim-lua/plenary.nvim',
        config = true,
        keys = {
            { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", 'Reveal undotree' },
        },
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        opts = {},
    },
}
