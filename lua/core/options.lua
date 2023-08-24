local opts = {
	termguicolors = true,
	backup = false,
	swapfile = false,
	undofile = true,
	splitright = true,
	softtabstop = 4,
	tabstop = 4,
	expandtab = true,
	shiftwidth = 4,
	shiftround = true,
	expandtab = true,
}

for k,v in pairs(opts) do
	vim.opt[k] = v
end
