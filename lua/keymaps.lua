local default_opts = { noremap = true, silent = true }

local set_keymap = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

set_keymap('n', '<space>sf', function()
	vim.cmd(':source %')
	print(string.format('Sourced file %s', vim.fn.expand('%')))
end, default_opts)

-- Buffer control
set_keymap('n', '<C-q>', ':bdelete<CR>', { noremap = true })
set_keymap('n', '<space>k', ':bdelete<CR>', { noremap = true })
set_keymap('n', '<S-l>', ':bnext<CR>', default_opts)
set_keymap('n', '<S-h>', ':bp<CR>', default_opts)

-- Telescope
set_keymap('n', '<space>ff', ':Telescope find_files<CR>', default_opts)
set_keymap('n', '<space>fb', ':Telescope buffers<CR>', default_opts)
set_keymap('n', '<space>ht', ':Telescope help_tags<CR>', default_opts)
set_keymap('n', '<space>hk', ':Telescope keymaps<CR>', default_opts)

-- NvimTree
set_keymap('n', '<space>e', ':NvimTreeToggle<CR>', default_opts)

--Neogit
local neogit = require('neogit')
set_keymap('n', '<space>gg', neogit.open, default_opts)

-- Color-picker
set_keymap('n', '<C-c>', '<cmd>PickColor<cr>', default_opts)
set_keymap('i', '<C-c>', '<cmd>PickColorInsert<cr>', default_opts)
