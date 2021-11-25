local remap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Remappign space as leader key
vim.g.mapleader = ' '

-- Source files
remap('n', '<leader>x', ':lua _G.execute_line()<CR>', { noremap = true })
remap('n', '<leader><leader>x', ':lua _G.source_file()<CR>', { noremap = true })

-- Execute commands faster in normal mode
remap('n', ';', ':', { noremap = true })
remap('n', ':', ';', { noremap = true })

-- Shift lines in visual mode
remap('v', '>', '>gv', opts)
remap('v', '<', '<gv', opts)

-- Open terminal window
remap('n', '<C-t>', ':vsplit | term<CR>', opts)

-- hlsearch toggle
remap('n', '<leader>h', ':set hlsearch!<CR>', opts)

-- Window Navigation normal mode
remap('n', '<C-h>', '<C-w>h<CR>', opts)
remap('n', '<C-j>', '<C-w>j<CR>', opts)
remap('n', '<C-k>', '<C-w>k<CR>', opts)
remap('n', '<C-l>', '<C-w>l<CR>', opts)

-- Move lines with alt+jk
remap('n', '<A-j>', ':m .+1<CR>==', opts)
remap('n', '<A-k>', ':m .-2<CR>==', opts)
remap('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
remap('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)
remap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
remap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Alternative to exit insert mode
remap('i', 'jj', '<Escape>', opts)

-- Delete word to the left of the cursor in ins-mode
-- OBS:  = Ctrl+Backspace
remap('i', '', '<C-w>', opts)

-- Control + s to save
remap('n', '<C-s>', ':w<CR>', { noremap = true })

-- Exit terminal mode
remap('t', '<Esc>', '<C-\\><C-N>', opts)

-- Cycle trough buffers
remap('n', '<tab>', ':bNext<CR>', opts)
remap('n', '<s-tab>', ':bprevious<CR>', opts)
remap('n', '<C-q>', ':bdelete<CR>', opts)

-- Telescope
remap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
remap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
remap('n', '<leader>lg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
remap('n', '<leader>fr', "<cmd>lua require('telescope.builtin').registers()<CR>", { noremap = true })
remap('n', 'gb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
