treesitter_ok, treesitter = pcall(require, "nvim-treesitter")
require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "rust", "javascript", "python", "bash", "julia", "css", "tsx" },
	sync_install = false,

	highlight = {
		enable = true,

		disable = { "c", "rust" },
		additional_vim_regex_highlighting = false,
	},
})
