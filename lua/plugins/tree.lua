return {
  'mikavilpas/yazi.nvim',
  cmd = 'Yazi',
  opts = {
    open_for_directories = true
  },
  keys = {
    {
      -- NOTE: this requires a version of yazi that includes
      -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
      '<leader>e',
      '<cmd>Yazi cwd<cr>',
      desc = 'Resume the last yazi session',
    },
  },
}
