vim.cmd'source ~/.config/nvim/myplugins.vim'
vim.cmd'colorscheme dracula'
require('sets')
require('bindings')
require('nvim-autopairs').setup()
require('nvim-treesitter').setup()
require('nvim_comment').setup()
require('nv-compe')
require('nv-tree')

require('lsps')
