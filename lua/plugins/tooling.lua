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
                        lspconfig[server_name].setup({
                            on_attach = lsp_hooks.on_attach,
                            capabilities = lsp_hooks.capabilities,
                        })
                    end,
                    ['lua_ls'] = function()
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
                    end,
                },
            })
            require('dap-vscode-js').setup({
                adapters = { 'pwa-node' },
            })
            require('mason-nvim-dap').setup({
                ensure_installed = { 'delve', 'js' },
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,

                    js = function(config)
                        local nodeConf = {
                            {
                                type = 'pwa-node',
                                request = 'launch',
                                name = 'Launch file',
                                program = '${file}',
                                port = '${port}',
                                cwd = '${workspaceFolder}',
                            },
                            {
                                type = 'pwa-node',
                                request = 'attach',
                                name = 'Attach',
                                processId = require('dap.utils').pick_process,
                                cwd = '${workspaceFolder}',
                            },
                        }
                        require('dap-vscode-js').setup({
                            debugger_path = vim.fn.expand('$HOME') .. '/.local/share/nvim/lazy/vscode-js-debug/',
                            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                        })
                        require('dap').configurations.javascript = nodeConf
                        require('dap').configurations.typescript = nodeConf
                        require('mason-nvim-dap').default_setup(config)
                    end,
                },
            })
        end,
    },
    {
        'mxsdev/nvim-dap-vscode-js',
        dependencies = {
            {
                'microsoft/vscode-js-debug',
                build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
            },
        },
        cmd = 'DapContinue',
        ft = { 'javascript', 'typescript' },
    },
}
