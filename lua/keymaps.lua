local default_opts = {noremap = true, silent = true}

local function set_keymap (mode, lhs,rhs,opts) vim.keymap.set(mode, lhs,rhs,opts) end

set_keymap("n","<space>sf",function ()
	vim.cmd(":source %")
	print(string.format("Sourced file %s",vim.fn.expand("%")))
end,default_opts)
set_keymap("n","<space>ff",":Telescope find_files<CR>",default_opts)
set_keymap("n","<space>b", ":Telescope buffers<CR>",default_opts)

set_keymap("n","<space>e",":NvimTreeToggle<CR>",default_opts)

