local default_opts = {noremap = true, silent = true}

vim.keymap.set("n","<space>sf",function ()
	vim.cmd(":source %")
	print(string.format("Sourced file %s",vim.fn.expand("%")))
end,default_opts)
vim.keymap.set("n","<space>ff",":Telescope find_files<CR>",default_opts)
vim.keymap.set("n","<space>b", ":Telescope buffers<CR>",default_opts)
