require('sets')
require('plugins')
require('bindings')
require('autocmds')
require('nv-tree')
require('lsps')
require('tokyo')
require('lualine').setup({
    options = {
        theme = 'tokyonight',
    },
})
vim.opt.background = 'dark'
