return {
    { 'j-hui/fidget.nvim', opts = {} },
    { 'blazkowolf/gruber-darker.nvim' },
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
        keys = {
            { '<C-h>', '<cmd> TmuxNavigateLeft<CR>', 'Window left' },
            { '<C-l>', '<cmd> TmuxNavigateRight<CR>', 'Window right' },
            { '<C-k>', '<cmd> TmuxNavigateUp<CR>', 'Window up' },
            { '<C-j>', '<cmd> TmuxNavigateDown<CR>', 'Window down' },
        },
    },
    { 'rebelot/kanagawa.nvim' },
    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
    {
        'akinsho/bufferline.nvim',
        config = true,
        lazy = false,
        keys = {
            { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
            { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
            { '<leader>bc', '<Cmd>bdelete<CR>', desc = 'Close buffer' },
        },
    },
    {
        'stevearc/dressing.nvim',
        config = true,
    },
}
