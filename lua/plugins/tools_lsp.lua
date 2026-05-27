-- Lsp Configs
Core.add_plugin({ Core.gh('neovim/nvim-lspconfig') })

-- Mason
Core.add_plugin({ Core.gh('mason-org/mason.nvim'), Core.gh('mason-org/mason-lspconfig.nvim') })

-- Tools and LSP
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'vtsls',
        'gopls',
    },
    automatic_enable = {
        exclude = {
            'lua_ls',
        },
    },
})

vim.lsp.enable('lua_ls')

Core.add_plugin({ Core.gh('lewis6991/gitsigns.nvim') })

local gitsigns = require('gitsigns')
gitsigns.setup({
    current_line_blame = true,
})

Core.add_keymap('n', '<leader>bl', gitsigns.blame_line, { desc = 'Git Blame line' })
Core.add_keymap('n', ']h', function()
    gitsigns.nav_hunk('next')
end, { desc = 'Git next hunk' })
Core.add_keymap('n', '[h', function()
    gitsigns.nav_hunk('prev')
end, { desc = 'Git prev hunk' })
