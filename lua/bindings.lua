local bindkeys = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
-- Remappign space as leader key
vim.g.mapleader = ' '
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
bindkeys('n','<C-s>',':w<CR>')
-- Exit terminal mode
bindkeys('t','<Esc>','<C-\\><C-N>',opts)
-- Exit terminal mode
bindkeys('t','<Esc>','<C-\\><C-N>',opts)
-- Cycle trough buffers
bindkeys('n','<tab>',':bNext<cr>',opts)
bindkeys('n','<s-tab>',':bprevious<cr>',opts)

-- Telescope 
bindkeys('n','<leader>ff','<cmd>lua require(\'telescope.builtin\').find_files()<cr>',{noremap=true})
bindkeys('n','<leader>fg','<cmd>lua require(\'telescope.builtin\').live_grep()<cr>',{noremap=true})
bindkeys('n','<leader>fb','<cmd>lua require(\'telescope.builtin\').buffers()<cr>',{noremap=true})
bindkeys('n','<leader>fh','<cmd>lua require(\'telescope.builtin\').help_tags()<cr>',{noremap=true})
-- Nv-compe 
bindkeys('i','<C-Space>','<cmd> lua requre(\'compe\').compe#complete()',{noremap=true,silent=true,expr=true})
bindkeys('i','<expr><CR>','<cmd> lua requre(\'compe\').compe#confirm(\'<CR>\')',{noremap=true,silent=true})
-- Nvim tree
bindkeys('n','<leader>e','<cmd> NvimTreeToggle<CR>',opts)
bindkeys('n','<leader>r','<cmd> NvimTreeRefresh<CR>',opts)
bindkeys('n','<leader>n','<cmd> NvimTreeFindFile<CR>',opts)
