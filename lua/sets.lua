-- Helpers
local o = vim.opt
--vim.cmd('filetype on')
--vim.cmd('syntax enable')

o.tgc = true
o.enc = "utf-8"
o.splitbelow = true
o.clipboard = "unnamedplus"
o.path:append("**")
o.incsearch = true
o.hlsearch = false
o.signcolumn='yes'
o.mouse = "a"
o.pumheight = 12
o.pumwidth = 20
o.scrolloff = 10
o.cmdheight = 2
o.hidden = true
o.inccommand = "split"
o.ts = 4
o.expandtab=true
o.swapfile = false
o.spelllang = "pt"
o.rnu = true
o.cursorline = true
o.completeopt = "menuone,noselect"
o.formatoptions:remove({'c','r','o'}) 

-- Plugin specific opttions
vim.g.simple_latex_viewer = 'okular'
vim.g.engines = {'pdflatex','xelatex','lualatex'}
