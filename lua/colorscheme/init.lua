local M  = {}
local DEFAULT_COLORSCHEME = "onedark"

M.set_colorscheme = function (colorscheme)
	if type(colorscheme) == "table" then
		colorscheme.set()
		return
	end
  local message = string.format("Expected colorscheme as table, but got %s",type(colorscheme))
	error(message)
end

M.colorschemes = {
	onedark = {
		set = function ()
			local onedark_ok,onedark = pcall(require,"onedark")
			if not onedark_ok then
				error("Colorscheme 'onedark' not available")
			end
			onedark.setup({style = "darker"})
			onedark.load()
		end,
		name = "onedark"
	},
  sonokai = {
		set = function()
			local sonokai_ok,_ = pcall(require,"sonokai")
			if not sonokai_ok then
				error("Colorscheme 'sonokai' not available")
			end
			vim.g.sonokai_style = "default"
			vim.cmd("colorscheme sonokai")
		end,
		name = "sonokai"
	},
	
}
M.default = M.colorschemes[DEFAULT_COLORSCHEME]

M.set_default = function (colorscheme)
	if not colorscheme then
		colorscheme = M.default
	end
	M.set_colorscheme(colorscheme)
	print(string.format("Colorscheme is now %s",colorscheme.name))
end


return M
