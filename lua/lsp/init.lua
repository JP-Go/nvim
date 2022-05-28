local lspconfig_ok, lspconfig = pcall(require, "lspconfig")

local servers = require("lsp.helpers").servers
local on_attach = require("lsp.helpers").common_on_attach
local capabilities = require("lsp.helpers").capabilities

if not lspconfig_ok then
	print("lspconfig not installed")
	return
end

for _, server in pairs(servers) do
	lspconfig[server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

local null_ls = require("null-ls")

local formatters = null_ls.builtins.formatting

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.keymap.set("n", "<space>cf", function()
						vim.lsp.buf.formatting_seq_sync({}, 2000, { "null_ls" })
					end)
					vim.lsp.buf.formatting_seq_sync({}, 2000, { "null_ls" })
				end,
			})
		end
	end,
	sources = { formatters.prettierd, formatters.stylua },
})
