require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('lsps')
require('lualine').setup({
    options = { theme = 'ayu_dark' },
})
vim.cmd([[colorscheme Tomorrow-Night-Bright]])
