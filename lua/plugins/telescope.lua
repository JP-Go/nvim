return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-fzy-native.nvim',
  },
  cmd = { 'Telescope' },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      extensions = {
        fzy_native = {
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
        },
      },
    })
    telescope.load_extension('fzy_native')
  end,
}
