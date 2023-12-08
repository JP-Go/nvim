local wk = require('which-key')
wk.register({
  g = {
    s = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage current hunk' },
    S = { '<cmd>Telescope git_status<cr>', 'Find git changes' },
    b = { '<cmd>Telescope git_branches<cr>', 'List git branches' },
  },
}, { prefix = '<leader>', noremap = true, silent = true })
