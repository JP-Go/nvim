local handlers = require('colorscheme.handlers')
local colorscheme = 'material'

local options_ok, options = pcall(handlers.get_colorscheme_options, colorscheme)
if not options_ok then
    vim.cmd('colorscheme ' .. colorscheme) -- Just set the scheme
    return
end

-- Set all options and colorscheme after
handlers.set_colorscheme_vars(options)
handlers.set_statusline_theme(options.theme)
if options.mappings then
    options.mappings()
end
if options.callback then
    options.callback()
end

vim.cmd('colorscheme ' .. colorscheme)
