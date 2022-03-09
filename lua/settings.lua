-- Helpers
local opt = vim.opt
vim.cmd("filetype on")

opt.termguicolors = true
opt.encoding = "utf-8"
opt.splitbelow = true
opt.splitright = true
opt.clipboard = "unnamed"
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
opt.tabstop = 2
opt.shiftwidth = 0
opt.softtabstop = 0
opt.smartindent = true
opt.expandtab = true
opt.swapfile = false
opt.wrap = false
opt.spelllang = "brazil"
opt.signcolumn = "yes"
opt.relativenumber = true
opt.number = true
opt.colorcolumn = "80"
opt.listchars = "tab:-> ,trail:·,space:·,extends:⋯,precedes:⋯,nbsp:‽"
opt.formatoptions = { j = true, q = true, c = false, r = false, o = false, t = true }
opt.undofile = true
opt.updatetime = 500
opt.foldminlines = 500

_G.execute_line = function()
  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  local line = vim.api.nvim_get_current_line()
  if ft == "lua" then
    vim.cmd("lua " .. line)
  elseif ft == "vim" then
    vim.cmd("exec " .. line)
  end
end
