local M = {}

M.servers = {
	{ name = 'pyright' },
	{ name = 'tsserver' },
	{ name = 'sumneko_lua', config_module = 'lsp.sumneko_lua' },
	{ name = 'cssls' },
	{ name = 'tailwindcss' },
	{ name = 'graphql' },
}
---@diagnostic disable-next-line: unused-local
M.common_on_attach = function(client, bufnr)
	vim.diagnostic.config({ virtual_text = false })
	local opts = { buffer = true, noremap = true }
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
	vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
M.capabilities = capabilities

return M
