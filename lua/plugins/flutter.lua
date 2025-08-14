local lsp_hooks = require('core.lsp_hooks')

return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    ft = { 'dart' },
    config = {
        lsp = {
            on_attach = lsp_hooks.on_attach,
            capabilities = lsp_hooks.capabilities,
        },
    },
}
