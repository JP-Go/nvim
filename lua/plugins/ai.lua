return {
    {
        'supermaven-inc/supermaven-nvim',
        config = true,
    },
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        version = false, -- Never set this value to "*"! Never!
        config = function()
            require('copilot').setup()
            require('avante').setup({
                provider = 'copilot',
            })
        end,
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = 'make',
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            --- The below dependencies are optional,
            'zbirenbaum/copilot.lua', -- for providers='copilot'
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { 'markdown', 'Avante' },
                },
                ft = { 'markdown', 'Avante' },
            },
        },
    },
}
