return {
    {
        'yetone/avante.nvim',
        event = 'VeryLazy',
        version = false, -- Never set this value to "*"! Never!
        config = function()
            require('copilot').setup()
            require('avante').setup({
                provider = 'copilot',
                behavior = {
                    enable_cursor_planning_mode = true,
                },
                copilot = {
                    model = 'claude-3.5-sonnet',
                    temperature = 0,
                    max_tokens = 8192,
                },
                system_prompt = function()
                    local hub = require('mcphub').get_hub_instance()
                    return hub:get_active_servers_prompt()
                end,
                -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
                custom_tools = function()
                    return {
                        require('mcphub.extensions.avante').mcp_tool(),
                    }
                end,
            })
        end,
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = 'make',
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            {

                'ravitemer/mcphub.nvim',
                build = 'bundled_build.lua',
                opts = {
                    use_bundled_binary = true,
                    extensions = {
                        avante = {
                            make_slash_commands = true,
                        },
                    },
                },
            },
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
