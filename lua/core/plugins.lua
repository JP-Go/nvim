return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('configs.which-key')
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    cmd = {
      'NvimTreeToggle',
      'NvimTreeFocus',
      'NvimTreeFindFile',
      'NvimTreeCollapse',
    },
    opts = require('configs.nvim-tree').opts,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'romgrk/barbar.nvim',
    config = function()
      require('configs.barbar')
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup({
        style = 'darker',
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Telescope' },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('configs.treesitter')
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('configs.lspconfig')
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'clangd',
          'tsserver',
          'cssls',
          'tailwindcss',
          'prismals',
          'dockerls',
          'docker_compose_language_service',
        },
      })
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
    },
    config = function()
      require('cmp').setup(require('configs.cmp').opts)
    end,
    event = 'InsertEnter',
  },
  {
    'TimUntersberger/neogit',
    config = function(_, opts)
      require('neogit').setup(opts)
      require('configs.git')
    end,
    opts = {},
  },
  {
    'smoka7/multicursors.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'smoka7/hydra.nvim',
    },
    opts = {},
    cmd = {
      'MCstart',
      'MCvisual',
      'MCclear',
      'MCpattern',
      'MCvisualPattern',
      'MCunderCursor',
    },
    keys = {
      {
        mode = { 'v', 'n' },
        '<C-n>',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selected text or word under the cursor',
      },
    },
  },
  {
    'mhartington/formatter.nvim',
    config = function()
      require('formatter').setup(require('configs.format').opts)
    end,
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('configs.lint')
    end,
    dependencies = { 'mhartington/formatter.nvim' },
  },
}
