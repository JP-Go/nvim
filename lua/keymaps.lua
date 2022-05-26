local default_opts = {noremap = true, silent = true}

local set_keymap = function(mode, lhs,rhs,opts) vim.keymap.set(mode, lhs,rhs,opts) end

local pass_callback = function (callback_function,args,message)
	return function ()
		if message then
			print(message)
		end
		if args then
			return callback_function(args)
		end
		return callback_function()
	end
end

local telescope_builtins = require("telescope.builtin")

set_keymap("n","<space>sf",function ()
	vim.cmd(":source %")
	print(string.format("Sourced file %s",vim.fn.expand("%")))
end,default_opts)

-- Telescope
set_keymap("n","<space>ff",pass_callback(telescope_builtins.find_files),default_opts)
set_keymap("n","<space>b", pass_callback(telescope_builtins.buffers) ,default_opts)
set_keymap("n","<space>ht",pass_callback(telescope_builtins.help_tags), default_opts)
set_keymap("n","<space>hk",pass_callback(telescope_builtins.keymaps), default_opts)

-- NvimTree
set_keymap("n","<space>e",":NvimTreeToggle<CR>",default_opts)

--Neogit
set_keymap("n","<space>g",pass_callback(require("neogit").open),default_opts)
