local wk = require('which-key')
wk.register({
    b = {
        c = {'<cmd>BufferClose<cr>', 'Close buffer'},
        n = {'<cmd>BufferNext<cr>', 'Next buffer'},
        b = {'<cmd>BufferPrevious<cr>', 'Previous buffer'},
    }
},{prefix = '<leader>', noremap = true, silent = true})
