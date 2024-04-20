local add_lsp_keymaps = function(bufnr)
  local wk = require('which-key')
  wk.register({
    ['<leader>'] = {
      ['ca'] = {
        function()
          vim.lsp.buf.code_action()
        end,
        'Code actions',
      },
      f = {
        s = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Find Symbols' },
        r = {
          function()
            vim.lsp.buf.references()
          end,
          'Find references',
        },
        d = {
          '<cmd>TroubleToggle workspace_diagnostics<cr>',
          'Find diagnostics',
        },
      },
      r = {
        function()
          vim.lsp.buf.rename()
        end,
        'Rename symbol',
      },
      d = {
        '<cmd>TroubleToggle document_diagnostics<cr>',
        'Show diagnostic',
      },
    },
    g = {
      d = {
        function()
          vim.lsp.buf.definition()
        end,
        'Go to definition',
      },
      D = {
        function()
          vim.lsp.buf.declaration()
        end,
        'Go to declaration',
      },
      r = {
        function()
          vim.lsp.buf.references()
        end,
        'Go to references',
      },
    },
    ['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      'Hover docs',
    },
    [']d'] = {
      function()
        vim.diagnostic.goto_next()
      end,
      'Next diagnostic',
    },
    ['[d'] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      'Prev diagnostic',
    },
  }, { noremap = false, buffer = bufnr })
  wk.register({
    ['<leader>'] = {
      ['ca'] = {
        function()
          vim.lsp.buf.code_action()
        end,
        'Apply code actions on selected range',
      },
    },
  }, { mode = 'v', noremap = false })
end

local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  add_lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
  'force',
  capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

return {
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'mfussenegger/nvim-jdtls',
    ft = { 'java' },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = {
      ensure_installed = {
        'lua_ls',
        'rust_analyzer',
        'clangd',
        'tsserver',
        'cssls',
        'tailwindcss',
        'dockerls',
        'docker_compose_language_service',
        'gopls',
        'volar',
        'unocss',
        'prismals',
        'jsonls',
        'pyright',
        'kotlin_language_server',
      },
    },
    dependencies = {
      'neovim/nvim-lspconfig',
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      local servers = {
        'clangd',
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        'jsonls',
        'lua_ls',
        'prismals',
        'pyright',
        'pyright',
        'tailwindcss',
        'gopls',
        'kotlin_language_server',
        'rust_analyzer',
      }

      -- Find out if on a vue project or not and select js server acordingly
      local found_vue_files = vim.fs.find(function(name, _)
        return name:match('.*%.vue')
      end, { limit = 1, type = 'file' })
      local is_vue_project = #found_vue_files > 0

      -- Vue volar in take over mode
      if is_vue_project then
        lspconfig.volar.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = {
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'vue',
          },
        })
      else
        lspconfig.tsserver.setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      for _, server in ipairs(servers) do
        local options = {
          on_attach = on_attach,
          capabilities = capabilities,
        }
        if server == 'lua_ls' then
          options = {
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
                    version = 'LuaJIT',
                  },
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                      '${3rd}/luv/library',
                      '${3rd}/busted/library',
                    },
                  },
                })
            end,
            settings = {
              Lua = {},
            },
          }
        end
        lspconfig[server].setup(options)
      end

      lspconfig.elixirls.setup({
        cmd = { 'elixir-ls' },
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
  exports = {
    capabilities = capabilities,
    on_attach = on_attach,
  },
}
