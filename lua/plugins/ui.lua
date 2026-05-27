Core.add_plugin({ Core.gh('romgrk/barbar.nvim') })

require('barbar').setup({
    icons = {
        filetype = { enabled = false },
    },
})

Core.add_keymap('n', '<Tab>', '<cmd>BufferNext<cr>', { desc = 'Next Buffer' })
Core.add_keymap('n', '<S-Tab>', '<cmd>BufferPrevious<cr>', { desc = 'Previous Buffer' })

Core.add_plugin({ Core.gh('sontungexpt/better-diagnostic-virtual-text') })

Core.add_autocmd('LspAttach', {
    pattern = { 'go', 'lua', 'gomod', 'gosum', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
    callback = function()
        require('better-diagnostic-virtual-text').setup()
    end,
})

Core.add_plugin({ Core.gh('OXY2DEV/markview.nvim') })

require('markview').setup()

Core.add_plugin({ Core.gh('chrisgrieser/nvim-rulebook') })

Core.add_plugin({ Core.gh('uhs-robert/oasis.nvim') })

require('oasis').setup()

vim.cmd.colorscheme('oasis-desert')
