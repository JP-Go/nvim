vim.bo.textwidth = 80
vim.opt.spell = true
vim.opt.spelllang = vim.opt.spelllang + 'en'

vim.api.nvim_buf_set_keymap('v', '<leader>i', 'c\textit{<ESC>pa}<ESC>', { noremap = true })
vim.api.nvim_buf_set_keymap('v', '<leader>b', 'c\textbf{<ESC>pa}<ESC>', { noremap = true })
