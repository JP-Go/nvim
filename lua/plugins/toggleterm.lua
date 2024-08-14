return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-\>]],
      })
    end,
  },
  {
    'NachoNievaG/atac.nvim',
    dependencies = { 'akinsho/toggleterm.nvim' },
    config = true,
    cmd = { 'Atac' },
  },
}
