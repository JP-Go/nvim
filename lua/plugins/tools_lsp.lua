-- Lsp Configs
Core.add_plugin({ Core.gh('neovim/nvim-lspconfig') })

-- Mason
Core.add_plugin({ Core.gh('mason-org/mason.nvim'), Core.gh('mason-org/mason-lspconfig.nvim') })

-- Tools and LSP
require('mason').setup()

local auto_install_lsps = { 'lua_ls', 'vtsls', 'gopls' }

require('mason-lspconfig').setup({
    ensure_installed = auto_install_lsps,
    automatic_enable = false,
})

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

Core.add_plugin({ Core.gh('SmiteshP/nvim-navic') })
local navic = require('nvim-navic')

navic.setup()

vim.lsp.config('*', {
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        end
    end,
})

vim.lsp.enable(auto_install_lsps)
