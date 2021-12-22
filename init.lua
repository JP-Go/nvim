require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('lsps')
require('lualine').setup({
    options = {
        component_separators = {
            left = '|',
            right = '|',
        },
        section_separators = {
            left = '',
            right = '',
        },
    },
})
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_italicize_strings = true
vim.cmd('colorscheme gruvbox')
vim.cmd('hi! Normal guibg=NONE') -- Transparent background
