local on_attach = require("lsp.helpers").common_on_attach

return {
	cmd = {"/home/jp/.local/bin/lua-language-server/bin/lua-language-server"},
	on_attach = on_attach
}
