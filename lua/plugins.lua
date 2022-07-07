local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
end

return require('packer').startup(function()
	use({
		'wbthomason/packer.nvim',
		commit = 'e4c2afb37d31e99b399425e102c58b091fbc16be',
	})
	use({
		'lewis6991/impatient.nvim',
		commit = '2aa872de40dbbebe8e2d3a0b8c5651b81fe8b235',
	})
	use({
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end,
		commit = '36c610a9717cc9ec426a07c8e6bf3b3abcb139d6',
	})
	use({
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
		commit = '4086630ce2aaf76b2652516ee3169f0b558f6be1',
	})
	use({
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup({ check_ts = true })
		end,
		commit = '972a7977e759733dd6721af7bcda7a67e40c010e',
	})
	use({
		'ziontee113/color-picker.nvim',
		config = function()
			require('color-picker')
			vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
		end,
		commit = 'c253206980696e258f508f4e5b000b0391a1d01d',
	})
	use({
		'mfussenegger/nvim-jdtls',
		commit = '703268d5b8479de4e0c27af93b203d56c1b53d2b',
	})
	use({
		'LunarVim/Colorschemes',
		commit = '641bc39e10b527eae1e9e29accdc987ffc4e6374',
	})
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('treesitter-config')
		end,
		commit = 'd3405a69460fb2a5ac95dce0e1f78508a80fbb18',
	})
	use({
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup()
		end,
		commit = '044a05c4c51051326900a53ba98fddacd15fea22',
	})
	use({
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			require('null-ls-config')
		end,
		commit = 'fbb1929b29beff82e0fc495670f00ef4b3bcbcd3',
	})
	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			{
				'nvim-lua/plenary.nvim',
				commit = '46e8bb9d3a852e0a2678be2d48179db545a9a39a',
			},
		},
		commit = 'a36500c7ee6e9dce08fde9d1c12a334cfca7553f',
	})
	use({
		'neovim/nvim-lspconfig',
		commit = 'd17179dbddcdf05f69b67ac13e2127c58a6295a7',
	})
	use({
		'lewis6991/gitsigns.nvim',
		tag = 'release',
		config = function()
			require('gitsigns').setup({
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'right_align',
					delay = 1000,
					ignore_whitespace = false,
				},
			})
		end,
		commit = '4883988cf8b623f63cc8c7d3f11b18b7e81f06ff',
	})
	use({
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
			commit = '2d02a56189e2bde11edd4712fea16f08a6656944',
		},
		config = function()
			require('nvim-tree-config')
		end,
		commit = '4bd919a75f37c7127ccfc746fc59a71068db3ceb',
	})
	use({
		'nvim-lualine/lualine.nvim',
		config = function()
			require('lualine-config')
		end,
		commit = 'c15e3b4c9eb7015dd58688b3d9bb1d659a49d3d1',
	})
	use({
		'L3MON4D3/LuaSnip',
		commit = '295cc9e422060b3200234b42cbee6dde1dfee765',
	})
	use({
		'saadparwaiz1/cmp_luasnip',
		commit = 'a9de941bcbda508d0a45d28ae366bb3f08db2e36',
	})
	use({
		'rafamadriz/friendly-snippets',
		commit = '24afb4c178d8ea28bfa73f37814ada43be478b1d',
	})
	use({
		'hrsh7th/nvim-cmp',
		config = function()
			require('cmp-config')
		end,
		commit = '9897465a7663997b7b42372164ffc3635321a2fe',
	})
	use({
		'hrsh7th/cmp-nvim-lsp',
		commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8',
	})
	use({
		'hrsh7th/cmp-buffer',
		commit = '62fc67a2b0205136bc3e312664624ba2ab4a9323',
	})
	use({
		'hrsh7th/cmp-path',
		commit = '981baf9525257ac3269e1b6701e376d6fbff6921',
	})
	use({
		'hrsh7th/cmp-cmdline',
		commit = 'c36ca4bc1dedb12b4ba6546b96c43896fd6e7252',
	})
	use({
		'TimUntersberger/neogit',
		commit = '585251902917f33b3574f2bc7670f68543bd3481',
	})

	if packer_bootstrap then
		require('packer').sync()
	end
end)
