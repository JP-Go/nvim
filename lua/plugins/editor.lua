return {
    { 'echasnovski/mini.surround', version = '*', config = true },
    { 'echasnovski/mini.pairs', version = '*', config = true },
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
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            dashboard = { enabled = true },
            explorer = { enabled = true, replace_netrw = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            lazygit = { enabled = true },
            terminal = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            {
                '<c-/>',
                function()
                    Snacks.terminal()
                end,
                desc = 'Toggle Terminal',
            },
            {
                '<leader>gg',
                function()
                    Snacks.lazygit()
                end,
                desc = 'Lazygit',
            },
            {
                '<leader>ff',
                function()
                    Snacks.picker.files()
                end,
                desc = 'Find Files',
            },
            {
                '<leader>fw',
                function()
                    Snacks.picker.grep()
                end,
                desc = 'Find word',
            },
            {
                '<leader>fg',
                function()
                    Snacks.picker.git_files()
                end,
                desc = 'Find Git Files',
            },
            {
                '<leader>fp',
                function()
                    Snacks.picker.projects()
                end,
                desc = 'Projects',
            },
            {
                '<leader>fr',
                function()
                    Snacks.picker.recent()
                end,
                desc = 'Recent',
            },
            {
                'gd',
                function()
                    Snacks.picker.lsp_definitions()
                end,
                desc = 'Goto Definition',
            },
            {
                'gD',
                function()
                    Snacks.picker.lsp_declarations()
                end,
                desc = 'Goto Declaration',
            },
            {
                'gr',
                function()
                    Snacks.picker.lsp_references()
                end,
                nowait = true,
                desc = 'References',
            },
            {
                'gI',
                function()
                    Snacks.picker.lsp_implementations()
                end,
                desc = 'Goto Implementation',
            },
            {
                'gy',
                function()
                    Snacks.picker.lsp_type_definitions()
                end,
                desc = 'Goto T[y]pe Definition',
            },
            {
                '<leader>ss',
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = 'LSP Symbols',
            },
            {
                '<leader>sS',
                function()
                    Snacks.picker.lsp_workspace_symbols()
                end,
                desc = 'LSP Workspace Symbols',
            },
            {
                '<leader>/',
                function()
                    Snacks.picker.grep()
                end,
                desc = 'Grep',
            },
            {
                '<leader>e',
                function()
                    Snacks.explorer()
                end,
                desc = 'File Explorer',
            },
            {
                '<leader><leader>',
                function()
                    Snacks.picker.smart()
                end,
                desc = 'File Explorer',
            },
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        config = true,
        opts = {
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
        },
    },
}
