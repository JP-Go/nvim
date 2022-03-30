-- TODO: Find a way to set these options when the colorscheme changes
local handlers = require("colorscheme.handlers")
local colorscheme = "tokyodark"

local options = handlers.get_colorscheme_options(colorscheme)

local lualine_theme = "auto"
if not options then
	vim.cmd("colorscheme " .. colorscheme) -- Just set the scheme
	handlers.set_statusline_theme(lualine_theme)
	return
end

-- Set all options and colorscheme after
if options.theme then
	lualine_theme = options.theme
end
if options.init then
	options.init()
end
if options.vars then
	handlers.set_colorscheme_vars(options)
end
if options.mappings then
	options.mappings()
end
if options.callback then
	options.callback()
end

vim.cmd("colorscheme " .. colorscheme)
handlers.set_statusline_theme(lualine_theme)

--bufferline
local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
	vim.notify("Failed to require bufferline", vim.log.levels.WARN)
	return
end

bufferline.setup()
