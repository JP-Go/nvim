local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute('packadd packer.nvim')
end

return require('packer').startup(function()
    -- General use plugins
    use({ 'wbthomason/packer.nvim' }) -- Plugin manager
    use({ 'neovim/nvim-lspconfig' }) -- LSP
    use({ 'nvim-lua/popup.nvim' }) -- required by telescope
    use({ 'nvim-lua/plenary.nvim' }) -- required by telescope
    use({ 'tjdevries/astronauta.nvim' }) -- Parse lua files in vim dirs other than lua
    use({ 'romgrk/barbar.nvim' }) -- Navbar
    use({ 'nvim-lualine/lualine.nvim' }) -- Statusline
    use({ 'kyazdani42/nvim-web-devicons' }) -- icons required lualine
    use({ 'onsails/lspkind-nvim' }) -- Icons
    use({ 'ThePrimeagen/vim-be-good' }) -- Just a training tool made by the man that vims
    use({ 'TimUntersberger/neogit' }) -- Git interaction

    -- Themes
    use({ 'sainnhe/everforest' })
    use({ 'sainnhe/gruvbox-material' })
    use({ 'shaunsingh/nord.nvim' })
    use({ 'LunarVim/Colorschemes' })
    use({ 'rafamadriz/themes.nvim' })
    use({ 'EdenEast/nightfox.nvim' })

    use({
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns-config')
        end,
    })
    use({
        'rcarriga/nvim-notify',
        config = function()
            require('notify-config')
        end,
    })

    use({
        'kyazdani42/nvim-tree.lua', -- File tree
        config = function()
            require('nvim-tree-config')
        end,
    })
    use({
        'glepnir/dashboard-nvim', -- Dashboard
        config = function()
            vim.g.dashboard_default_executive = 'telescope'
        end,
    })
    use({
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        config = function()
            require('telescope-config')
        end,
    })
    use({
        'blackCauldron7/surround.nvim', -- Surround objects
        config = function()
            require('surround-config')
        end,
    })
    use({
        'hrsh7th/nvim-cmp', -- Completion engine
        config = function()
            require('cmp-config')
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
        'windwp/nvim-autopairs', -- Autodelimiter
        config = function()
            require('autopairs-config')
        end,
    })
    use({ 'L3MON4D3/LuaSnip' }) -- Snippet engine
    use({ 'rafamadriz/friendly-snippets' }) -- Misc snippets
    -- Lazy loaded plugins
    use({
        'nvim-treesitter/nvim-treesitter', -- File parsing
        config = function()
            require('treesitter-config')
        end,
    })
    use({ 'windwp/nvim-ts-autotag' }) -- Tag closer

    use({
        'terrortylor/nvim-comment',
        config = function()
            require('nvim-comment-config') -- Commennter
        end,
    })

    use({
        'JP-Go/simple-latex', -- My LaTeX plugin
        ft = { 'tex' },
        config = function()
            require('simple-latex').setup({ viewer = 'okular' })
        end,
    })

    use({
        'mhartington/formatter.nvim', -- Code formatter
        config = function()
            require('formatter-config')
        end,
    })
    use({
        'norcalli/nvim-colorizer.lua', -- Color highlighter
        config = function()
            require('colorizer-config')
        end,
    })
end)
