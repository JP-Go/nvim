local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remappign space as leader key
vim.g.mapleader = ' '

-- Source files or lines
keymap('n', '<leader>x', '<cmd>lua _G.execute_line()<CR>', { noremap = true })
keymap('n', '<leader><leader>x', '<cmd> source %<CR>', { noremap = true })

-- Execute commands faster in normal mode
keymap('n', ';', ':', { noremap = true })
keymap('n', ':', ';', { noremap = true })

-- Shift lines in visual mode
keymap('v', '>', '>gv', opts)
keymap('v', '<', '<gv', opts)

-- hlsearch toggle
keymap('n', '<leader>h', '<cmd>set hlsearch!<CR>', opts)

-- Window Navigation normal mode
keymap('n', '<C-h>', '<C-w>h<CR>', opts)
keymap('n', '<C-j>', '<C-w>j<CR>', opts)
keymap('n', '<C-k>', '<C-w>k<CR>', opts)
keymap('n', '<C-l>', '<C-w>l<CR>', opts)

-- Move lines with alt+jk
keymap('v', '<A-j>', "<cmd>m '>+1<CR>gv=gv", opts)
keymap('v', '<A-k>', "<cmd>m '<-2<CR>gv=gv", opts)

-- Alternative to exit insert mode
keymap('i', 'jj', '<Escape>', opts)

-- Delete word to the left of the cursor in ins-mode
-- OBS:  = Ctrl+Backspace
keymap('i', '', '<C-w>', opts)

-- Control + s to save
keymap('n', '<C-s>', '<cmd>w<CR>', { noremap = true })

-- Exit terminal mode
keymap('t', '<Esc>', '<C-\\><C-N>', opts)

-- Cycle trough buffers
keymap('n', '<S-l>', '<cmd>bnext<CR>', opts)
keymap('n', '<S-h>', '<cmd>bprevious<CR>', opts)
keymap('n', '<C-q>', '<cmd>bdelete<CR>', opts)

-- Telescope
keymap('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
keymap('n', '<leader>lg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
keymap('n', '<leader>gr', "<cmd>lua require('telescope.builtin').registers()<CR>", { noremap = true })
keymap('n', 'gb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })

-- Neogit
keymap('n', '<leader>ng', "<cmd>lua require('neogit').open()<CR>", { noremap = true })

-- Nvim Tree
keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)
