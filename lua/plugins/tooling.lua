return {
    {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = { 'VeryLazy' },
        dependencies = {
            'williamboman/mason.nvim',
            'neovim/nvim-lspconfig',
            'jay-babu/mason-nvim-dap.nvim',
        },
        config = function()
            require('lspconfig')
            local defaultServers = {
                'lua_ls',
                'ts_ls',
                'gopls',
                'jsonls',
            }
            require('mason').setup()
            local masonConfig = {
                ensure_installed = defaultServers,
            }
            require('mason-lspconfig').setup(masonConfig)
            vim.lsp.enable(defaultServers)
            vim.diagnostic.config({ virtual_text = true, float = { border = 'single' } })
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
