local add_lsp_keymaps = function(bufnr)
    local wk = require('which-key')
    wk.add({
        {
            '<leader>ca',
            function()
                vim.lsp.buf.code_action()
            end,
            desc = 'Code actions',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>fs',
            '<cmd>Telescope lsp_workspace_symbols<cr>',
            desc = 'Find Symbols',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>fr',
            function()
                vim.lsp.buf.references()
            end,
            desc = 'Find References',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>fd',
            '<cmd>Trouble diagnostics<cr>',
            desc = 'Find Diagnostics',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>r',
            function()
                vim.lsp.buf.rename()
            end,
            desc = 'Rename symbol',
            buffer = bufnr,
            remap = true,
        },
        {
            'gd',
            function()
                vim.lsp.buf.definition()
            end,
            desc = 'Go to definition',
            buffer = bufnr,
            remap = true,
        },
        {
            'gD',
            function()
                vim.lsp.buf.declaration()
            end,
            desc = 'Go to declaration',
            buffer = bufnr,
            remap = true,
        },
        {
            'gr',
            function()
                vim.lsp.buf.references()
            end,
            desc = 'Go to references',
            buffer = bufnr,
            remap = true,
        },
        {
            'K',
            function()
                vim.lsp.buf.hover()
            end,
            desc = 'Hover docs',
            buffer = bufnr,
            remap = true,
        },
    })
end

local on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    add_lsp_keymaps(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

return {
    {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
    },
    {
        'williamboman/mason-lspconfig.nvim',
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
                            on_attach = on_attach,
                            capabilities = capabilities,
                        })
                    end,
                    ['lua_ls'] = function()
                        local lspconfig = require('lspconfig')
                        lspconfig.lua_ls.setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
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
        end,
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = true,
            },
            'neovim/nvim-lspconfig',
        },
    },
    'neovim/nvim-lspconfig',
    exports = {
        capabilities = capabilities,
        on_attach = on_attach,
    },
}
