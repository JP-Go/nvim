Core.add_plugin({
    Core.gh('MunifTanjim/nui.nvim'),
    Core.gh('yetone/avante.nvim'),
})

require('avante').setup({
    provider = 'opencode',
    behaviour = {
        auto_suggestion = false,
    },
    acp_providers = {
        ['opencode'] = {
            command = 'opencode',
            args = { 'acp' },
        },
    },
    {
        shortcuts = {
            -- shortcut example
            -- {
            --     name = 'refactor',
            --     description = 'Refactor code with best practices',
            --     details = 'Automatically refactor code to improve readability, maintainability, and follow best practices while preserving functionality',
            --     prompt = 'Please refactor this code following best practices, improving readability and maintainability while preserving functionality.',
            -- },
            -- Add more custom shortcuts...
        },
    },
})

Core.add_keymap({ 'n', 'x' }, '<leader>aic', '<cmd>AvanteChat<cr>', { desc = 'Open AI Chat' })
Core.add_keymap({ 'n', 'x' }, '<leader>aii', '<cmd>AvanteAsk<cr>', { desc = 'Ask AI' })
Core.add_keymap({ 'n', 'x' }, '<leader>aie', '<cmd>AvanteEdit<cr>', { desc = 'Edit using AI' })
