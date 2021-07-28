local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup( function()
use {'wbthomason/packer.nvim'}
use {'neovim/nvim-lspconfig'}
use {"terrortylor/nvim-comment" }
use {'nvim-lua/popup.nvim'} -- required by telescope
use {'nvim-lua/plenary.nvim'} -- required by telescope
use {'nvim-telescope/telescope.nvim'}
use {'tjdevries/astronauta.nvim'}
use {'nvim-treesitter/nvim-treesitter'}
use {'JP-Go/simple-latex',ft={'tex'},config =  function ()
    require('simple-latex').setup{viewer = 'qpdfview'}
end}
use {'romgrk/barbar.nvim'}
-- TODO Lazy loading
use {'hrsh7th/nvim-compe'}
use {"hrsh7th/vim-vsnip"}
use {"rafamadriz/friendly-snippets"}
use {'windwp/nvim-autopairs'}
use {'norcalli/nvim-colorizer.lua'}
use {'kyazdani42/nvim-web-devicons'} -- for tree icons required by nvim-tree
use {'kyazdani42/nvim-tree.lua'}
use {'mhartington/formatter.nvim'}
use {'windwp/nvim-ts-autotag'}
use {'folke/tokyonight.nvim'}
use {'hoob3rt/lualine.nvim'}
end )
