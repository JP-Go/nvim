require('plugins')
require('sets')
require('bindings')
require('autocmds')
require('nv-colorizer')
require('nv-compe')
require('nv-tree')
require('nv-autopairs')
require("nv-treesitter")
require('nvim_comment').setup()
require('lspsaga').init_lsp_saga()

require('lsps')

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
