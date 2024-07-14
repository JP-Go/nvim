return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require('which-key')

    wk.add({
      { '<leader>b', group = 'Buffers' },
      { '<leader>bb', '<cmd>BufferPrevious<cr>', desc = 'Previous buffer' },
      { '<leader>bc', '<cmd>BufferClose<cr>', desc = 'Close buffer' },
      { '<leader>bn', '<cmd>BufferNext<cr>', desc = 'Next buffer' },
      { '<leader>f', group = 'Find' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find buffers' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find gelp' },
      { '<leader>fw', '<cmd>Telescope live_grep<cr>', desc = 'Find word' },
      {
        '<leader>e',
        '<cmd>Neotree toggle right<cr>',
        desc = 'Toggle file tree',
      },
      {
        '<leader>g',
        group = 'Git',
      },
      {
        '<leader>gS',
        '<cmd>Telescope git_status<cr>',
        desc = 'Find git changes',
      },
      {
        '<leader>gb',
        '<cmd>Telescope git_branches<cr>',
        desc = 'List git branches',
      },
      {
        '<leader>gs',
        '<cmd>Gitsigns stage_hunk<cr>',
        desc = 'Stage current hunk',
      },
    })
    wk.add({
      { '<ESC>', '<cmd>nohlsearch<cr>', desc = 'Clear search highlight' },
      { '<S-Tab>', '<cmd>BufferPrevious<cr>', desc = 'Previous buffer' },
      { '<Tab>', '<cmd>BufferNext<cr>', desc = 'Next buffer' },
    })
  end,
}
