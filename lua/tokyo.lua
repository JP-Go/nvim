vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" ,"nvim-tree"}
vim.g.tokyonight_lualine_bold = true

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "blue", error = "red" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
