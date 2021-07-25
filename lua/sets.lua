-- Helpers
local opt = vim.opt
vim.cmd('filetype on')

opt.termguicolors = true
opt.encoding = "utf-8"
opt.splitbelow = true
opt.clipboard = "unnamedplus"
opt.path = ".,/usr/include,,**"
opt.incsearch = true
opt.hlsearch = false
opt.mouse = "a"
opt.pumheight = 12
opt.pumwidth = 20
opt.scrolloff = 10
opt.cmdheight = 2
opt.hidden = true
opt.inccommand = "split"
opt.cursorline = true
opt.completeopt = "menuone,noselect"
opt.tabstop = 4
opt.shiftwidth = 0
opt.softtabstop = 0
opt.smartindent = true
opt.expandtab = true
opt.swapfile = false
opt.spelllang = "pt"
opt.signcolumn='yes'
opt.relativenumber = true
opt.number = true
opt.list = true
opt.listchars = 'tab:-> ,trail:⸱,space:⸱,extends:⋯,precedes:⋯,nbsp:‽,eol:'
opt.formatoptions = {j=true,q=true}
opt.undofile = true

-- Source files or lines

_G.source_file = function()
    local ft = vim.api.nvim_buf_get_option(0,'filetype')
    if ft == 'lua' then
        vim.cmd('luafile %') 
    elseif ft=='vim' then
        vim.cmd('source %')
    end
    print('File sourced')
end

_G.execute_line = function()
    local ft = vim.api.nvim_buf_get_option(0,'filetype')
    local line = vim.api.nvim_get_current_line()
    if ft == 'lua' then
        vim.cmd('lua print(' .. line .. ')') 
    elseif ft=='vim' then
        vim.cmd('exec ' .. line)
    end
end

