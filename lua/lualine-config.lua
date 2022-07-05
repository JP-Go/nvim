local lualine_ok, lualine = pcall(require, 'lualine')

if not lualine_ok then
	print('Error: Lualine is not installed')
	return
end

local colors = require('lualine.themes.auto')

local lsp_module = {
	function()
		local msg = 'None'
		local clients = vim.lsp.get_active_clients()
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local client_fts = client.config.filetypes
			if
				vim.fn.index(client_fts, buf_ft) > -1
				and not (client.name == 'null-ls')
			then
				return client.name
			end
		end
	end,
	icon = '⚙ LSP:',
	color = { bg = colors.normal.c.bg, fg = colors.normal.c.fg },
}

local config = {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'NvimTree' },
		always_divide_middle = true,
		globalstatus = true,
	},

	sections = {
		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = { 'filename', 'branch' },
		lualine_x = { 'diagnostics', 'filetype' },
		lualine_y = { lsp_module },
		lualine_z = { 'location' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

lualine.setup(config)
