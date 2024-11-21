return {
    'folke/which-key.nvim',
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require('which-key')

        wk.add({
            { '<leader>y', '"+y', desc = 'Yank to system clipboard' },
            { '<leader>y', '"+y', desc = 'Yank to system clipboard (visual mode)', mode = 'v' },
            { '<leader>p', '"+p', desc = 'Paste from system clipboard' },
            { '<leader>p', '"+p', desc = 'Paste from system clipboard (visual mode)', mode = 'v' },
            { '<leader>b', group = 'Buffers' },
            { '<leader>f', group = 'Find' },
        })
        wk.add({
            { '<ESC>', '<cmd>nohlsearch<cr>', desc = 'Clear search highlight' },
        })
    end,
}
