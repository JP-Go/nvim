local null_ls_ok, null_ls = pcall(require, "null-ls")

if not null_ls_ok then
	vim.notify("Failed to require null-ls", vim.log.levels.WARN)
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
	sources = {
		formatting.stylua.with({ extra_args = { "--config-path", vim.fn.expand("~/.dotfiles/stylua.toml") } }),
		formatting.prettier,
		formatting.black,
		formatting.rustfmt,
	},
})
