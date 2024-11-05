local opts = {
    termguicolors = true,
    backup = false,
    swapfile = false,
    undofile = true,
    splitright = true,
    softtabstop = 4,
    tabstop = 4,
    shiftwidth = 4,
    laststatus = 3,
    shiftround = true,
    expandtab = true,
    cmdheight = 2,
    textwidth = 80,
    number = false,
    hidden = true,
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end
