require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('lsps')
require('lualine').setup({
    options = {
        theme = 'dracula-nvim',
    },
})
vim.opt.background = 'dark'
vim.cmd('colorscheme dracula')
