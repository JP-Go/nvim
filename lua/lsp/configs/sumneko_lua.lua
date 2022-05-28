local on_attach = require("lsp.helpers").common_on_attach
local capabilities = require("lsp.helpers").capabilities

return {
	cmd = {"lua-language-server"},
	on_attach = on_attach,
	capabilities = capabilities,
}
