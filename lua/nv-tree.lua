vim.g.nvim_tree_width = 30
vim.g.nvim_tree_gitignore = true 
vim.g.nvim_tree_follow = true 
vim.g.nvim_tree_hide_dotfiles = true 
vim.g.nvim_tree_git_hl = true 
vim.g.nvim_tree_highlight_opened_files = true 
vim.g.nvim_tree_tab_open = true 
vim.g.nvim_tree_width_allow_resize  = true 
vim.g.nvim_tree_disable_netrw = true 
vim.g.nvim_tree_hijack_netrw = true 
vim.g.nvim_tree_add_trailing = true 
vim.g.nvim_tree_group_empty = true 
vim.g.nvim_tree_lsp_diagnostics = true 
vim.g.nvim_tree_auto_open = true
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
vim.g.nvim_tree_show_icons = { git= true, folders= true, files= true, folder_arrows= true }
