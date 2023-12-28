return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local wk = require('which-key')

      wk.register({
          f = {
              name = 'Find',
              f = { '<cmd>Telescope find_files<cr>', 'Find files' },
              w = { '<cmd>Telescope live_grep<cr>', 'Find word' },
              h = { '<cmd>Telescope help_tags<cr>', 'Find gelp' },
              b = { '<cmd>Telescope buffers<cr>', 'Find buffers' },
          },
          g = {
              s = { '<cmd>Gitsigns stage_hunk<cr>', 'Stage current hunk' },
              S = { '<cmd>Telescope git_status<cr>', 'Find git changes' },
              b = { '<cmd>Telescope git_branches<cr>', 'List git branches' },
          },
          b = {
              c = {'<cmd>BufferClose<cr>', 'Close buffer'},
              n = {'<cmd>BufferNext<cr>', 'Next buffer'},
              b = {'<cmd>BufferPrevious<cr>', 'Previous buffer'},
          },
          e = { '<cmd>Neotree toggle left<cr>', 'Toggle file tree' },
      }, { prefix = '<leader>' })
      wk.register({
          ['<ESC>'] = { '<cmd>nohlsearch<cr>', 'Clear search highlight' },
      })
      wk.register({
          a = {
              a = {
                  function()
                      require('align').align_to_char(1, true, true)
                  end,
                  'Align to char',
              },
          },
      }, { prefix = '<leader>', noremap = true, mode = 'v' })
  end
}
