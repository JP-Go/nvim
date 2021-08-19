local common_on_attach = require('lsps').common_on_attach
local root_pattern = require('lspconfig.util').root_pattern('Gemfile', '.git', vim.fn.expand('%:t'))
require('lspconfig').solargraph.setup({
    on_attach = common_on_attach,
    root_dir = root_pattern,
})
