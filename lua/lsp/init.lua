local lspconfig_ok, lspconfig = pcall(require,"lspconfig")
local null_ls_ok,null_ls = pcall(require,"null-ls")

local servers = require("lsp.helpers").servers
local on_attach = require("lsp.helpers").common_on_attach
local capabilities = require("lsp.helpers").capabilities

if not lspconfig_ok then
 	print("lspconfig not installed")
	return
end

for _,server in pairs(servers) do
	local has_special_config,config = pcall(require,string.format("lsp.configs.%s", server))
	if has_special_config then
		lspconfig[server].setup(config)
	else
		lspconfig[server].setup( {
			on_attach = on_attach,
			capabilities = capabilities
		})
	end
end

if not null_ls_ok then
 	print("null_ls not installed")
	return
end

local formatters = null_ls.builtins.formatting

null_ls.setup({
	formatters.stylua,
	formatters.prettierd
})
