require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
        disable = { 'latex', 'tex' },
    },
    indent = {
        enable = true,
        disable = { 'latex', 'tex' },
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
})
