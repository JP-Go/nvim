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
