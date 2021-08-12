local common_on_attach = require('lsps').common_on_attach
require('lspconfig').ccls.setup({ on_attach = common_on_attach })
