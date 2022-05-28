local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
		require("treesitter-config")
  end}
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
	use 'jose-elias-alvarez/null-ls.nvim'
  use 'navarasu/onedark.nvim'
	use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			config = function ()
				require("nvim-tree-config")
			end
	}
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use {'hrsh7th/nvim-cmp', config = function() require("cmp-config") end}
  use 'sainnhe/sonokai'
	use 'TimUntersberger/neogit'

		if packer_bootstrap then
			require('packer').sync()
		end
  end)
