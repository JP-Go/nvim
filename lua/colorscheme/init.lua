local M = {}
local DEFAULT_COLORSCHEME = 'rose_pine'

M.set_colorscheme = function(colorscheme)
	if not (type(colorscheme) == 'table') then
		local message = string.format('Expected table, got %s', type(colorscheme))
		error(message)
	end
	colorscheme.set()
end

M.colorschemes = {
	onedark = {
		set = function()
			local onedark_ok, onedark = pcall(require, 'onedark')
			if not onedark_ok then
				print("Colorscheme 'onedark' not available")
			end
			onedark.setup({
				style = 'warm',
				code_style = {
					comments = 'italic',
					keywords = 'none',
					functions = 'none',
					strings = 'none',
					variables = 'none',
				},
			})
			onedark.load()
		end,
		name = 'onedark',
	},
	rose_pine = {
		set =  function ()
			local rose_ok, rose = pcall(require,"rose-pine")
			if not rose_ok then
				print("Colorscheme 'rose-pine' not available")
			end
			rose.setup({dark_variant = "moon"})
			vim.cmd("colorscheme rose-pine")
		end,
		name = "rose-pine"
	},
	sonokai = {
		set = function()
			vim.g.sonokai_style = 'default'
			local sonokai_ok, _ = pcall(vim.cmd, 'colorscheme sonokai')
			if not sonokai_ok then
				print("Colorscheme 'sonokai' not available")
			end
		end,
		name = 'sonokai',
	},
}
M.default = M.colorschemes[DEFAULT_COLORSCHEME]

M.set_default = function(colorscheme)
	if not colorscheme then
		colorscheme = M.default
	end
	M.set_colorscheme(colorscheme)
end

return M
