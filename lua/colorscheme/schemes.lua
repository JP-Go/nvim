return {
	onedark = {
		set = function()
			local onedarkpro_ok, onedarkpro = pcall(require, 'onedarkpro')
			if not onedarkpro_ok then
				print("Colorscheme 'onedarkpro' not available")
			end
			onedarkpro.setup({
				dark_theme = 'onedark_dark',
				plugins = {
					all = true,
				},
				styles = {
					comments = 'italic',
					keywords = 'italic,bold',
				},
				options = {
					bold = true,
					italic = true,
					underline = true,
					undercurl = true,
					cursorline = true,
					transparency = false,
					terminal_colors = true,
					window_unfocussed_color = false,
				},
			})
			---@diagnostic disable-next-line: missing-parameter
			onedarkpro.load()
		end,
		name = 'onedark_pro',
	},
	rose_pine = {
		set = function()
			local rose_ok, rose = pcall(require, 'rose-pine')
			if not rose_ok then
				print("Colorscheme 'rose-pine' not available")
			end
			rose.setup({ dark_variant = 'moon' })
			vim.cmd('colorscheme rose-pine')
		end,
		name = 'rose-pine',
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
