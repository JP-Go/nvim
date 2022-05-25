local lspconfig_ok, lspconfig = pcall(require,"lspconfig")
local servers = require("lsp.helpers").servers
local on_attach = require("lsp.helpers").common_on_attach

if not lspconfig_ok then
  	print("lspconfig not installed")
	return
end

for _,server in pairs(servers) do
	local has_special_config,config = pcall(require,string.format("lsp.configs.%s", server))
	if has_special_config then
		lspconfig[server].setup(config)
	else
		lspconfig[server].setup( { on_attach = on_attach })
	end
end
