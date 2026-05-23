vim.cmd.packadd('nohlsearch')
vim.cmd.packadd('nvim.undotree')
Core.add_keymap('n', '<leader>u', '<cmd>Undotree<cr>', { desc = 'Opens undotree' })

-- Mini surround + auto pair delimiters + icons
Core.add_plugin({
    { src = Core.gh('nvim-mini/mini.surround'), version = 'stable' },
    { src = Core.gh('nvim-mini/mini.icons'), version = 'stable' },
    { src = Core.gh('nvim-mini/mini.pairs'), version = 'stable' },
})
-- Basic functionalities
require('mini.surround').setup()
require('mini.pairs').setup()

-- Lazygit
Core.add_plugin({ Core.gh('kdheepak/lazygit.nvim') })
require('lazygit')
Core.add_keymap('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Lazygit' })

-- Treesitter
Core.add_plugin({
    { src = Core.gh('nvim-lua/plenary.nvim') },
    { src = Core.gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
})
require('nvim-treesitter').install({
    'javascript',
    'typescript',
    'jsx',
    'tsx',
    'go',
    'gomod',
    'gosum',
    'html',
    'lua',
})
