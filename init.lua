require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('nv-tree')
require('lsps')
require('lualine').setup({
    options = {
        -- theme = 'tokyonight', -- uncomment to use tokyonight in statusline
        theme = 'dracula-nvim',
    },
})
vim.opt.background = 'dark'
vim.cmd('colorscheme dracula')
-- require('tokyo') -- uncomment to use tokyonight
