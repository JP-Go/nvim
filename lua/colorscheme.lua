local colorscheme = 'gruvbox-material'

if colorscheme == 'gruvbox-material' then
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_transparent_mode = 1
end

if colorscheme == 'everforest' then
    vim.g.everforest_background = 'hard'
    vim.g.everforest_material_transparent_mode = 1
end

vim.cmd('colorscheme ' .. colorscheme)
vim.cmd('hi! Normal guibg=NONE') -- Transparent Background
