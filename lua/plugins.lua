 -- Packer bootstrap
 
return require('packer').startup(function()
  -- Packer can manage itself
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
  use {'hrsh7th/nvim-cmp', config = function() require("cmp-config") end}
  use {'sainnhe/sonokai', config = function() vim.cmd('colorscheme sonokai')  end}
  end)
