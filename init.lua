require('sets')
require('plugins')
require('remaps')
require('autocmds')
require('lsps')
require('statusline')
vim.g.gruvbox_contrast_dark = 'medium'
vim.g.gruvbox_italicize_strings = true
vim.cmd('colorscheme gruvbox')
vim.cmd('hi! Normal guibg=NONE') -- Transparent background
