local on_attach = require('lsps').common_on_attach
local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

require('lspconfig').pylsp.setup{
    on_attach = on_attach;
    capabilities = capabilities;
    filetypes = { 'python'},
}

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"python"},
    settings = {
        rootMarkers = {".git/", "requirements.txt"},
    }
}
vim.cmd('LspStart')
