local bindkeys = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Remappign space as leader key
vim.g.mapleader = ' '

-- Source files
bindkeys('n', '<leader>x', ':lua _G.execute_line()<CR>', { noremap = true })
bindkeys('n', '<leader><leader>x', ':lua _G.source_file()<CR>', { noremap = true })

-- Shift lines in visual mode
bindkeys('v', '>', '>gv', opts)
bindkeys('v', '<', '<gv', opts)

-- Open terminal
bindkeys('n', '<C-t>', ':vsplit | term<CR>', opts)

-- hlsearch toggle
bindkeys('n', '<leader>h', ':set hlsearch!<CR>', opts)

-- Window Navigation normal mode
bindkeys('n', '<C-h>', '<C-w>h<CR>', opts)
bindkeys('n', '<C-j>', '<C-w>j<CR>', opts)
bindkeys('n', '<C-k>', '<C-w>k<CR>', opts)
bindkeys('n', '<C-l>', '<C-w>l<CR>', opts)

-- Move lines with alt+jk
bindkeys('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
bindkeys('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
bindkeys('n', '<A-j>', ':m .+1<CR>==', opts)
bindkeys('n', '<A-k>', ':m .-2<CR>==', opts)
bindkeys('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
bindkeys('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- Alternative exit insert mode
bindkeys('i', 'jj', '<Escape>', opts)

-- Control + s to save
bindkeys('n', '<C-s>', ':w<CR>', { noremap = true })

-- Exit terminal mode
bindkeys('t', '<Esc>', '<C-\\><C-N>', opts)

-- Cycle trough buffers
bindkeys('n', '<tab>', ':bNext<CR>', opts)
bindkeys('n', '<s-tab>', ':bprevious<CR>', opts)
bindkeys('n', '<C-q>', ':bdelete<CR>', opts)

-- Telescope
bindkeys('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
bindkeys('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
bindkeys('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
bindkeys('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true })

-- Nvim tree
bindkeys('n', '<leader>e', '<cmd> NvimTreeToggle<CR>', opts)
bindkeys('n', '<leader>r', '<cmd> NvimTreeRefresh<CR>', opts)
bindkeys('n', '<leader>n', '<cmd> NvimTreeFindFile<CR>', opts)
