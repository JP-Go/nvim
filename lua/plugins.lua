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
    use({ 'nvim-telescope/telescope.nvim' })
    use({ 'tjdevries/astronauta.nvim' })
    use({ 'romgrk/barbar.nvim' })
    use({ 'kyazdani42/nvim-web-devicons' }) -- for tree icons required by nvim-tree
    use({ 'folke/tokyonight.nvim' })
    use({ 'Mofiqul/dracula.nvim' })
    use({ 'hoob3rt/lualine.nvim', })
    use({ 'navarasu/onedark.nvim' })

    -- Lazy loading
    use({
        'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        config = function()
            require('nv-treesitter')
        end,
    })
    use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' })

    use({
        'terrortylor/nvim-comment',
        event = 'BufEnter',
        config = function()
            require('nvim_comment').setup()
        end,
    })

    use({
        'JP-Go/simple-latex',
        ft = { 'tex' },
        config = function()
            require('simple-latex').setup({ viewer = 'evince' })
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
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/vim-vsnip' },
        },
    })

    use({ 'rafamadriz/friendly-snippets' })

    use({
        'windwp/nvim-autopairs',
        config = function()
            require('nv-autopairs')
        end,
    })
    use({
        'mhartington/formatter.nvim',
        ft = { 'javascript', 'javscriptreact', 'typescript', 'typescriptreact', 'python', 'lua', 'rust' },
        config = function()
            require('format')
        end,
    })
    use({
        'norcalli/nvim-colorizer.lua',
        event = 'BufWinEnter',
        config = function()
            require('nv-colorizer')
        end,
    })

    use({ 'onsails/lspkind-nvim' })
    use({ 'ThePrimeagen/vim-be-good' })
    use({ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' })
end)
