local colorscheme = 'tomorrow'

local colorscheme_options = {
    ['gruvbox-material'] = {
        predicate = 'gruvbox_material',
        props = {
            background = 'hard',
            transparent_mode = 1,
        },
    },
    everforest = {
        predicate = 'everforest',
        props = {
            background = 'hard',
            transparent_mode = 1,
        },
    },
}

for scheme, options in pairs(colorscheme_options) do
    if colorscheme == scheme then
        for prop, value in pairs(options.props) do
            local var_name = options.predicate .. '_' .. prop
            vim.g[var_name] = value
        end
    end
end

vim.cmd('colorscheme ' .. colorscheme)
vim.cmd('hi! Normal guibg=NONE') -- Transparent Background
