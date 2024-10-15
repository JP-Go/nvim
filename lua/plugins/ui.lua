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
    { 'vague2k/vague.nvim' },
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
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
    },
}
