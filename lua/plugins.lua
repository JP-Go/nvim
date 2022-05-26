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
  use 'navarasu/onedark.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use {'hrsh7th/nvim-cmp', config = function() require("cmp-config") end}
  use {'sainnhe/sonokai'}
  end)
