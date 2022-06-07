local default_opts = { noremap = true, silent = true }

local set_keymap = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap("n", "<space>sf", function()
	vim.cmd(":source %")
	print(string.format("Sourced file %s", vim.fn.expand("%")))
end, default_opts)

set_keymap("n", "<space>d", ":bdelete<CR>", default_opts)

-- Telescope
local telescope_builtins = require("telescope.builtin")
set_keymap("n", "<space>ff", telescope_builtins.find_files, default_opts)
set_keymap("n", "<space>b", telescope_builtins.buffers, default_opts)
set_keymap("n", "<space>ht", telescope_builtins.help_tags, default_opts)
set_keymap("n", "<space>hk", telescope_builtins.keymaps, default_opts)

-- NvimTree
set_keymap("n", "<space>e", ":NvimTreeToggle<CR>", default_opts)

--Neogit
local neogit = require("neogit")
set_keymap("n", "<space>gg", neogit.open, default_opts)
