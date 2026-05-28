vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Prevents showing extra messages when using completion
vim.opt.shortmess:append('c')
vim.opt.cmdheight = 2
vim.opt.number = true
vim.opt.timeoutlen = 500
vim.opt.updatetime = 4000
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.completeopt = 'menu,menuone,noselect,popup'
vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.background = 'dark'

require('vim._core.ui2').enable({})
