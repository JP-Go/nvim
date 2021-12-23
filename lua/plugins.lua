local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute('packadd packer.nvim')
end

return require('packer').startup(function()
    use({ 'wbthomason/packer.nvim' })
    use({ 'neovim/nvim-lspconfig' })
    use({ 'nvim-lua/popup.nvim' }) -- required by telescope
    use({ 'nvim-lua/plenary.nvim' }) -- required by telescope
    use({ 'tjdevries/astronauta.nvim' })
    use({ 'romgrk/barbar.nvim' })
    use({ 'nvim-lualine/lualine.nvim' })
    use({ 'kyazdani42/nvim-web-devicons' }) -- icons required lualine
    use({ 'onsails/lspkind-nvim' })
    use({ 'ThePrimeagen/vim-be-good' })
    use({ 'TimUntersberger/neogit' })
    use({ 'EdenEast/nightfox.nvim' })
    use({ 'kyazdani42/nvim-tree.lua' })

    use({ 'LunarVim/Colorschemes' })
    use({ 'rafamadriz/themes.nvim' })
    use({
        'nvim-telescope/telescope.nvim',
        config = function()
            require('telescope')
        end,
    })
    use({
        'hrsh7th/nvim-cmp',
        config = function()
            require('nv-cmp')
        end,
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
        },
    })
    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nv-autopairs')
        end,
    })
    use({ 'L3MON4D3/LuaSnip' })
    use({ 'rafamadriz/friendly-snippets' })
    -- Lazy loaded plugins
    use({
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nv-treesitter')
        end,
    })
    use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' })

    use({
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup()
        end,
    })

    use({
        'JP-Go/simple-latex',
        ft = { 'tex' },
        config = function()
            require('simple-latex').setup({ viewer = 'okular' })
        end,
    })

    use({
        'mhartington/formatter.nvim',
        config = function()
            require('format')
        end,
    })
    use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('nv-colorizer')
        end,
    })
end)
