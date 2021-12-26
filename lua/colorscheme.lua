local colorscheme = 'gruvbox-material'

if colorscheme == 'gruvbox_material' then
    vim.g.gruvbox_material_palette = 'material'
end
vim.cmd('colorscheme ' .. colorscheme)
vim.cmd('hi! Normal guibg=NONE') -- Transparent background
