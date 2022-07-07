local nls_ok, nls = pcall(require, 'null-ls')
local util = require('vim.lsp.util')

if not nls_ok then
	print('Null-ls not installed')
	return
end

local formatters = nls.builtins.formatting
local diagnostics = nls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local formatting_callback = function(client, bufnr)
	vim.keymap.set('n', '<space>cf', function()
		local params = util.make_formatting_params({})
		client.request('textDocument/formatting', params, nil, bufnr)
	end, { buffer = bufnr })
end

nls.setup({
	on_attach = function(client, bufnr)
		formatting_callback(client, bufnr)
		if client.supports_method('textDocument/formatting') then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_seq_sync({}, 2000, { 'null-ls' })
				end,
			})
		end
	end,
	sources = {
		formatters.stylua.with({
			extra_args = { '--config-path=/home/jp/.config/stylua.toml' },
		}),
		formatters.prettier,
		formatters.yapf,
		diagnostics.mypy,
		diagnostics.flake8,
	},
})
