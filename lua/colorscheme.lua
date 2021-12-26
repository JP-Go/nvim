local colorscheme = 'gruvbox-material'

if colorscheme == 'gruvbox-material' then
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_transparent_mode = 1
end
vim.cmd('colorscheme ' .. colorscheme)
