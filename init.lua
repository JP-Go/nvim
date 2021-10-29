require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('lsps')
require('lualine').setup({
    options = { theme = 'codedark' },
})
vim.cmd([[colorscheme tomorrow-night-bright]])
