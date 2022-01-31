local handlers = require("lsp.handlers")
local servers = handlers.servers

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("Failed to require lspconfig", vim.log.levels.WARN)
	return
end

handlers.setup()

for _, server in ipairs(servers) do
	local options = {
		on_attach = handlers.common_on_attach,
		capabilities = handlers.common_capabilities,
	}
	if server == "jdtls" then
		local jdtls_configs = require("lsp.settings.jdtls")
		options = vim.tbl_deep_extend("force", options, jdtls_configs)
	end
	if server == "sumneko_lua" then
		local sumneko_configs = require("lsp.settings.sumneko")
		options = vim.tbl_deep_extend("force", options, sumneko_configs)
	end
	if server == "tsserver" then
		local common_on_attach = handlers.common_on_attach
		options.on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			client.resolved_capabilities.document_range_formatting = false
			common_on_attach(client, bufnr)
		end
	end

	lspconfig[server].setup(options)
end

require("lsp.null-ls-config")
