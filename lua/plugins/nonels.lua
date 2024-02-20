local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'folke/which-key.nvim',
  },
  event = 'VeryLazy',
  config = function()
    local null_ls = require('null-ls')
    null_ls.setup({
      on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

          local wk = require('which-key')
          wk.register({
            ['<leader>'] = {
              ['cf'] = {
                function()
                  vim.lsp.buf.format({ async = false })
                end,
                'Format buffer',
              },
            },
          })
          wk.register({
            ['<leader>'] = {
              ['cf'] = {
                vim.lsp.buf.format({ async = false }),
                'Format the current range (if supported)',
              },
            },
          }, { mode = 'x' })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
      sources = {
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint.with({
          condition = function(utils)
            return utils.root_has_file({
              'eslint.config.js',
              '.eslintrc',
              '.eslintrc.js',
              '.eslintrc.cjs',
              '.eslintrc.yaml',
              '.eslintrc.yml',
              '.eslintrc.json',
            })
          end,
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return not utils.root_has_file({
              'biome.json',
            })
          end,
        }),
        null_ls.builtins.formatting.biome.with({
          condition = function(utils)
            return utils.root_has_file({
              'biome.json',
            })
          end,
        }),
      },
    })
  end,
}
