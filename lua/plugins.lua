local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup( function()
use 'windwp/nvim-autopairs'
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use 'JP-Go/simple-latex'
use 'nvim-lua/popup.nvim' -- required by telescope
use 'nvim-lua/plenary.nvim' -- required by telescope
use 'nvim-telescope/telescope.nvim'
use 'folke/which-key.nvim'
use 'terrortylor/nvim-comment'
use 'hrsh7th/nvim-compe'
use 'neovim/nvim-lspconfig'
use 'kyazdani42/nvim-web-devicons' -- for file icons (require by nivm-tree)
use 'kyazdani42/nvim-tree.lua'
use 'folke/tokyonight.nvim'
use 'tjdevries/colorbuddy.vim'
use 'tjdevries/gruvbuddy.nvim'
use 'hrsh7th/vim-vsnip'
use 'hrsh7th/vim-vsnip-integ'
end )
