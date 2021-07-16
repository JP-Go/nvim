local bindkeys = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- Remappign space as leader key
vim.g.mapleader = ' '

bindkeys('n','<leader>x',':lua _G.execute_line()<CR>',{noremap = true})
bindkeys('n','<leader><leader>x',':lua _G.source_file()<CR>',{noremap = true})

-- hlsearch toggle
bindkeys('n','<leader>h',':set hlsearch!<CR>',opts)
-- Window Navigation normal mode
bindkeys('n','<C-h>','<C-w>h<CR>',opts)
bindkeys('n','<C-j>','<C-w>j<CR>',opts)
bindkeys('n','<C-k>','<C-w>k<CR>',opts)
bindkeys('n','<C-l>','<C-w>l<CR>',opts)
-- Alternative exit insert mode
bindkeys('i','jj','<Escape>',opts)
-- Control + s to save
bindkeys('n','<C-s>',':w<CR>',{noremap=true})
-- Exit terminal mode
bindkeys('t','<Esc>','<C-\\><C-N>',opts)
-- Exit terminal mode
bindkeys('t','<Esc>','<C-\\><C-N>',opts)
-- Cycle trough buffers
bindkeys('n','<tab>',':bNext<CR>',opts)
bindkeys('n','<s-tab>',':bprevious<CR>',opts)
bindkeys('n','<C-q>',':bdelete<CR>',opts)

-- Telescope 
bindkeys('n','<leader>ff','<cmd>lua require(\'telescope.builtin\').find_files()<CR>',{noremap=true})
bindkeys('n','<leader>fg','<cmd>lua require(\'telescope.builtin\').live_grep()<CR>',{noremap=true})
bindkeys('n','<leader>fb','<cmd>lua require(\'telescope.builtin\').buffers()<CR>',{noremap=true})
bindkeys('n','<leader>fh','<cmd>lua require(\'telescope.builtin\').help_tags()<CR>',{noremap=true})
-- Nvim tree
bindkeys('n','<leader>e','<cmd> NvimTreeToggle<CR>',opts)
bindkeys('n','<leader>r','<cmd> NvimTreeRefresh<CR>',opts)
bindkeys('n','<leader>n','<cmd> NvimTreeFindFile<CR>',opts)
