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
					native_lsp = true,
					polygot = false,
					treesitter = true,
				},
				styles = {
					comments = 'italic',
					keywords = 'italic,bold',
				},
				options = {
					bold = false, -- Use the themes opinionated bold styles?
					italic = false, -- Use the themes opinionated italic styles?
					underline = false, -- Use the themes opinionated underline styles?
					undercurl = false, -- Use the themes opinionated undercurl styles?
					cursorline = false, -- Use cursorline highlighting?
					transparency = false, -- Use a transparent background?
					terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
					window_unfocussed_color = true, -- When the window is out of focus, change the normal background?
				},
			})
			onedarkpro.load()
		end,
		name = 'onedarkpro',
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
