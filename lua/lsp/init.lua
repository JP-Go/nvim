local handlers = require('lsp.handlers')
local settings = require('lsp.settings')

local servers = handlers.servers
local common_on_attach = handlers.common_on_attach
local common_capabilities = handlers.common_capabilities

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
    vim.notify('Failed to require lspconfig')
    return
end

for _, server in ipairs(servers) do
    local options = {
        on_attach = common_on_attach,
        capabilities = common_capabilities,
    }
    if server == 'jdtls' then
        local jdtls_configs = settings.jdtls
        options = vim.tbl_deep_extend('force', options, jdtls_configs)
    end
    if server == 'sumneko_lua' then
        local sumneko_configs = settings.sumneko
        options = vim.tbl_deep_extend('force', options, sumneko_configs)
    end

    lspconfig[server].setup(options)
end
