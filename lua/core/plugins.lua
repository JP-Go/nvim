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
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        cmd = {"NvimTreeToggle","NvimTreeFocus","NvimTreeFindFile","NvimTreeCollapse"},
        opts = require("configs.nvim-tree").opts
    },
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    "romgrk/barbar.nvim",
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function ()
            require("onedark").setup({
                style = 'darker'
            })
        end
    },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {"nvim-lua/plenary.nvim"},
        cmd = {"Telescope"}
	},
	{	"nvim-treesitter/nvim-treesitter",
		config = function()
			require("configs.treesitter")
		end,
	},
	{
		'williamboman/mason.nvim',
		config = function()
            require("configs.lspconfig")
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

	},
    {
         'hrsh7th/nvim-cmp',
         dependencies = {
             'hrsh7th/cmp-nvim-lsp',
             'hrsh7th/cmp-buffer',
             'hrsh7th/cmp-path',
             'hrsh7th/cmp-cmdline',
             'L3MON4D3/LuaSnip',
             'saadparwaiz1/cmp_luasnip',
             'windwp/nvim-autopairs'
         },
         config = function()
             require('cmp').setup(
                require("configs.cmp").opts
             )
         end,
         event = "InsertEnter"
     },
     {
         "rebelot/heirline.nvim",
         opts = {}
     },
     {
         "TimUntersberger/neogit",
         opts = {}
     }

}
