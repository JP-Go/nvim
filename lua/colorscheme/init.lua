local M = {}
local DEFAULT_COLORSCHEME = 'onedark'

M.set_colorscheme = function(colorscheme)
	if not (type(colorscheme) == 'table') then
		local message = string.format('Expected table, got %s', type(colorscheme))
		error(message)
	end
	colorscheme.set()
end

M.colorschemes = require("colorscheme.schemes")
M.default = M.colorschemes[DEFAULT_COLORSCHEME]

M.set_default = function(colorscheme)
	if not colorscheme then
		colorscheme = M.default
	end
	M.set_colorscheme(colorscheme)
end

return M
