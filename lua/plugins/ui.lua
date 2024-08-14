return {
  { 'j-hui/fidget.nvim', opts = {} },
  { 'blazkowolf/gruber-darker.nvim' },
  { 'rebelot/kanagawa.nvim' },
  {
    'akinsho/bufferline.nvim',
    config = true,
    lazy = false,
    keys = {
      { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
      { '<leader>bc', '<Cmd>bdelete<CR>', desc = 'Close buffer' },
    },
  },
  {
    'stevearc/dressing.nvim',
    config = true,
  },
}
