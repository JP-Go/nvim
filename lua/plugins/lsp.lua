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
                d = { '<cmd>Telescope diagnostics<cr>', 'Find diagnostics' },
            },
            r = {
                function()
                    vim.lsp.buf.rename()
                end,
                'Rename symbol',
            },
            d = {
                function()
                    vim.diagnostic.open_float()
                end,
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
end

local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    add_lsp_keymaps(bufnr)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    {
        'williamboman/mason.nvim',
        config = true
    },
    {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config  = {
            ensure_installed = {
                'lua_ls',
                'clangd',
                'tsserver',
                'cssls',
                'tailwindcss',
                'dockerls',
                'docker_compose_language_service',
                'gopls',
                'volar',
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
                'csharp_ls',
                'docker_compose_language_service',
                'dockerls',
                'jsonls',
                'lua_ls',
                'prismals',
                'pyright',
                'tailwindcss',
                'unocss',
                -- 'jdtls',
                'gopls',
                'kotlin_language_server',
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
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end

            lspconfig.elixirls.setup({
                cmd = { 'elixir-ls' },
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end
    },
    exports = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
}
