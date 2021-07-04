local on_attach = require('lsps').common_on_attach
local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;

require('lspconfig').tsserver.setup{
    on_attach = on_attach;
    capabilities = capabilities;
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript",
        "typescriptreact", "typescript.tsx"
    },
}

vim.cmd('LspStart')
