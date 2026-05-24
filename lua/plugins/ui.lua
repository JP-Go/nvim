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
    pattern = '*',
    callback = function()
        require('better-diagnostic-virtual-text').setup()
    end,
})
