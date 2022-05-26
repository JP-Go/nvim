local M  = {}
local DEFAULT_COLORSCHEME = "onedark"

M.set_colorscheme = function (colorscheme)
	if type(colorscheme) == "table" then
		colorscheme.set()
		print(string.format("Colorscheme is now %s",colorscheme.name))
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
				print("Colorscheme 'onedark' not available")
			end
			onedark.setup({style = "darker"})
			onedark.load()
		end,
		name = "onedark"
	},
  sonokai = {
		set = function()
			vim.g.sonokai_style = "default"
			local sonokai_ok,_ = pcall(vim.cmd,"colorscheme sonokai")
			if not sonokai_ok then
				print("Colorscheme 'sonokai' not available")
			end
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
end


return M
