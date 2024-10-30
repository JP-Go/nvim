return {
    'folke/which-key.nvim',
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        local wk = require('which-key')

        wk.add({
            { '<leader>y', '"+y', desc = 'Yank to system clipboard' },
            { '<leader>y', '"+y', desc = 'Yank to system clipboard (visual mode)', mode = 'v' },
            { '<leader>b', group = 'Buffers' },
            { '<leader>f', group = 'Find' },
            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
            { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
            { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find gelp' },
            { '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Find word' },
        })
        wk.add({
            { '<ESC>', '<cmd>nohlsearch<cr>', desc = 'Clear search highlight' },
        })
    end,
}
