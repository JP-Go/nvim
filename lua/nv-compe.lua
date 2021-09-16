require('compe').setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        nvim_lsp = {priority = 9},
        nvim_lua = {priority = 8},
        vsnip = {priority=7},
        path = {priority = 5},
        buffer = true,
    },
})

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap(
    'i',
    '<Tab>',
    "compe#confirm({ 'keys': '<tab>', 'select': v:true })",
    { noremap = true, expr = true, silent = true }
)
vim.api.nvim_set_keymap('i', '<C-e>', "compe#close('<C-e>')", { noremap = true, expr = true, silent = true })
