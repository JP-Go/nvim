local M = {}

M.servers = {"pyright","tsserver","sumneko_lua",}

M.common_on_attach = function(client, bufnr)
	vim.diagnostic.config({virtual_text = false})
  local opts = {buffer = true, noremap = true}
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  vim.keymap.set('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.keymap.set('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.keymap.set('n', '<space>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', '<space>r', ':lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', opts)
  vim.keymap.set('n', '<space>d', ':lua vim.diagnostic.open_float()<CR>', opts)
  vim.keymap.set('n', ']d', ':lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '[d', ':lua vim.diagnostic.goto_prev()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
M.capabilities = capabilities

return M
