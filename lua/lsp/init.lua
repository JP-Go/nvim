local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

local servers = require("lsp.helpers").servers
local on_attach = require("lsp.helpers").common_on_attach
local capabilities = require("lsp.helpers").capabilities

if not lspconfig_ok then
	print("lspconfig not installed")
	return
end

for _, server in pairs(servers) do
	local options = { on_attach = on_attach, capabilities = capabilities }
	if server.config_module ~= nil then
		local server_config = require(server.config_module)
		options = vim.tbl_extend("force", options, server_config)
	end
	lspconfig[server.name].setup(options)
end
