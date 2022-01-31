local M = {}

M.set_colorscheme_vars = function(options)
	local predicate = options.predicate or ""
	local sep = options.separator or ""
	for var, value in pairs(options.vars) do
		local var_name = predicate .. sep .. var
		vim.g[var_name] = value
	end
end

M.set_statusline_theme = function(theme)
	if not theme then
		theme = "auto"
	end
	local lualine_status_ok, lualine = pcall(require, "lualine")
	if not lualine_status_ok then
		vim.notify("Failed to require lualine", vim.log.levels.WARN)
		return
	end

	lualine.setup({
		options = {
			theme = theme,
		},
	})
end

M.get_colorscheme_options = function(colorscheme_name)
	local options_ok, options = pcall(require, "colorscheme." .. colorscheme_name)
	if not options_ok then
		return false
	end
	return options
end

return M
