call plug#begin( stdpath('data') . '/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JP-Go/simple-latex'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'terrortylor/nvim-comment'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
call plug#end()
