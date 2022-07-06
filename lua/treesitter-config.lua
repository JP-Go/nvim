local treesitter_ok, _ = pcall(require, 'nvim-treesitter')
if not treesitter_ok then
	print('Package treesitter not installed')
	return
end
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'c',
		'lua',
		'rust',
		'javascript',
		'python',
		'bash',
		'julia',
		'css',
		'tsx',
		'graphql',
	},
	sync_install = false,

	highlight = {
		enable = true,

		disable = { 'c', 'rust' },
		additional_vim_regex_highlighting = false,
	},
})
