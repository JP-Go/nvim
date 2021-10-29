require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('lsps')
require('lualine').setup({
    options = { theme = 'onedark' },
})
vim.cmd([[colorscheme onedark]])
