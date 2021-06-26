vim.g.nvim_tree_width = 30
vim.g.nvim_tree_gitignore = 1 
vim.g.nvim_tree_follow = 1 
vim.g.nvim_tree_hide_dotfiles = 1 
vim.g.nvim_tree_git_hl = 1 
vim.g.nvim_tree_highlight_opened_files = 1 
vim.g.nvim_tree_tab_open = 1 
vim.g.nvim_tree_width_allow_resize  = 1 
vim.g.nvim_tree_disable_netrw = 0 
vim.g.nvim_tree_hijack_netrw = 0 
vim.g.nvim_tree_add_trailing = 1 
vim.g.nvim_tree_group_empty = 1 
vim.g.nvim_tree_lsp_diagnostics = 1 
vim.g.nvim_tree_window_picker_exclude = {
        filetype = {
         'packer',
         'qf'
       },
        buftype = {
         'terminal'
       }
     }

vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' } 
vim.g.nvim_tree_show_icons = { git= 1, folders= 1, files= 1, folder_arrows= 1 }
