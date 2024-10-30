return {
    { 'j-hui/fidget.nvim', opts = {} },
    { 'blazkowolf/gruber-darker.nvim' },
    { 'loctvl842/monokai-pro.nvim' },
    {
        'toppair/peek.nvim',
        event = { 'VeryLazy' },
        build = 'deno task --quiet build:fast',
        config = function()
            require('peek').setup({
                app = 'firefox',
            })
            vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
            vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
        end,
        cmd = {
            'PeekOpen',
            'PeekClose',
        },
    },
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
