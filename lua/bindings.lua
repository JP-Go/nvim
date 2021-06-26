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
-- Exit terminal mode
bindkeys('t','<Esc>','<C-\\><C-N>',opts)
-- Cycle trough buffers
bindkeys('n','<tab>',':bNext<cr>',opts)
bindkeys('n','<s-tab>',':bprevious<cr>',opts)

-- Telescope keybindings
bindkeys('n','<leader>ff','<cmd>lua require(\'telescope.builtin\').find_files()<cr>',{noremap=true})
bindkeys('n','<leader>fg','<cmd>lua require(\'telescope.builtin\').live_grep()<cr>',{noremap=true})
bindkeys('n','<leader>fb','<cmd>lua require(\'telescope.builtin\').buffers()<cr>',{noremap=true})
bindkeys('n','<leader>fh','<cmd>lua require(\'telescope.builtin\').help_tags()<cr>',{noremap=true})
-- Nv-compe keybindins
bindkeys('i','<expr> <C-Space>','<cmd> lua requre(\'compe\').compe#complete()',opts)
bindkeys('i','<expr> <CR>     ','<cmd> lua requre(\'compe\').compe#confirm(\'<CR>\')',opts)
bindkeys('i','<expr> <C-e>    ','<cmd> lua requre(\'compe\').compe#close(\'<C-e>\')',opts)

