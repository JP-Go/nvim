local on_attach = require("lsp.helpers").common_on_attach
local capabilities = require("lsp.helpers").capabilities

return {
	cmd = { "lua-language-server" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			}
		}
	}
}
