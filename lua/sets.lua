-- Helpers
local o = vim.o
local bo = vim.bo
local wo = vim.wo
vim.cmd('filetype on')
vim.cmd('set formatoptions -="cro"') 

o.tgc = true
o.enc = "utf-8"
o.splitbelow = true
o.clipboard = "unnamedplus"
o.path=".,/usr/include,,**"
o.incsearch = true
o.hlsearch = false
o.mouse = "a"
o.pumheight = 12
o.pumwidth = 20
o.scrolloff = 10
o.cmdheight = 2
o.hidden = true
o.inccommand = "split"
o.cursorline = true
o.completeopt = "menuone,noselect"
bo.tabstop = 4
bo.shiftwidth = 0
bo.softtabstop = 0
bo.smartindent = true
bo.expandtab = true
bo.swapfile = false
bo.spelllang = "pt"
wo.signcolumn='yes'
wo.rnu = true
wo.number = true

-- Plugin specific opttions
vim.g.simple_latex_viewer = 'okular'
vim.g.engines = {'pdflatex','xelatex','lualatex'}
