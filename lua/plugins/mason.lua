local lsp_hooks = require('core.lsp_hooks')
return {
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'tsserver',
          'cssls',
          'tailwindcss',
          'dockerls',
          'docker_compose_language_service',
          'gopls',
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require('lspconfig')[server_name].setup({
              on_attach = lsp_hooks.on_attach,
              capabilities = lsp_hooks.capabilities,
            })
          end,
          ['lua_ls'] = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
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

                client.config.settings.Lua =
                  vim.tbl_deep_extend('force', client.config.settings.Lua, {
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
                      -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                      -- library = vim.api.nvim_get_runtime_file("", true)
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
          end,
        },
      })
      require('mason-nvim-dap').setup({
        ensure_installed = { 'delve', 'node2', 'coreclr' },
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })
    end,
  }
}