local lsp_hooks = require('core.lsp_hooks')
return {
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    event = { 'VeryLazy' },
    version = 'v1.x',
    dependencies = {
      { 'mason-org/mason.nvim', version = 'v1.x' },
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_enable = {
          'lua_ls',
          'vtsls',
          'dockerls',
          'docker_compose_language_service',
          'gopls',
          'jsonls',
        },
        ensure_installed = {
          'lua_ls',
          'vtsls',
          'dockerls',
          'docker_compose_language_service',
          'gopls',
          'jsonls',
        },
        handlers = {
          function(server_name) -- default handler
            vim.lsp.config(server_name, {
              on_attach = lsp_hooks.on_attach,
              capabilities = lsp_hooks.capabilities,
            })
            vim.lsp.enable(server_name)
          end,
          ["vtsls"] = function()
            vim.lsp.config("vtsls", {
              on_attach = lsp_hooks.on_attach,
              capabilities = lsp_hooks.capabilities,
              settings = {
                vtsls = {
                  autoUseWorkspaceTsdk = true
                }
              }
            })
            vim.lsp.enable("vtsls")
          end,
          ['lua_ls'] = function()
            vim.lsp.config("lua_ls", {
              on_attach = lsp_hooks.on_attach,
              capabilities = lsp_hooks.capabilities,
              on_init = function(client)
                local path = client.workspace_folders[1].name
                if
                    vim.loop.fs_stat(path .. '/.luarc.json')
                    or vim.loop.fs_stat(path .. '/.luarc.jsonc')
                then
                  return
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                  },

                  -- Make the server aware of Neovim runtime files
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                      -- Depending on the usage, you might want to add additional paths here.
                      -- "${3rd}/luv/library"
                      -- "${3rd}/busted/library",
                    },
                  },
                })
              end,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                },
              },
            })
            vim.lsp.enable("lua_ls")
          end,
        },
      })
      require('mason-nvim-dap').setup({
        automatic_installation = false,
        ensure_installed = { 'delve', 'js' },
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })
    end,
  },
}
