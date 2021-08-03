local on_attach = require('lsps').common_on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
