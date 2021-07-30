require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        disable = { 'tex', 'latex' },
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
})
