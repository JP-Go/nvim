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
	use('wbthomason/packer.nvim')
	use('mfussenegger/nvim-jdtls')
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('treesitter-config')
		end,
	})
	use({
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	})
	use({
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			require('null-ls-config')
		end,
	})
	use({
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
	})
	use('neovim/nvim-lspconfig')
	use('navarasu/onedark.nvim')
	use({ 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*' })
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
	})
	use({
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		config = function()
			require('nvim-tree-config')
		end,
	})
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function()
			require('lualine-config')
		end,
	})
	use('L3MON4D3/LuaSnip')
	use('saadparwaiz1/cmp_luasnip')
	use('rafamadriz/friendly-snippets')
	use({
		'hrsh7th/nvim-cmp',
		config = function()
			require('cmp-config')
		end,
	})
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('sainnhe/sonokai')
	use('TimUntersberger/neogit')

	if packer_bootstrap then
		require('packer').sync()
	end
end)
