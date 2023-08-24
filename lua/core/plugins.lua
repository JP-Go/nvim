return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("configs.which-key")
		end,
	},
	{
		"catppuccin/nvim", name = "catppuccin",
		lazy = false,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end

	},
	{ 
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {"nvim-lua/plenary.nvim"}
	},
	{	"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.treesitter")
		end
	},
	{
		'williamboman/mason.nvim',
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls","clangd","tsserver","cssls","tailwindcss","prismals", "dockerls","docker_compose_language_service" }
			})
		end,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		    	"neovim/nvim-lspconfig",

		}

	}
}
