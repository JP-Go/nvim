vim.fn.sign_define(
    'LspDiagnosticsSignError',
    { texthl = 'LspDiagnosticsDefaultError', text = '', numhl = 'LspDiagnosticsDefaultError' }
)
vim.fn.sign_define(
    'LspDiagnosticsSignWarning',
    { texthl = 'LspDiagnosticsDefaultWarning', text = '', numhl = 'LspDiagnosticsDefaultWarning' }
)
vim.fn.sign_define(
    'LspDiagnosticsSignHint',
    { texthl = 'LspDiagnosticsDefaultHint', text = '', numhl = 'LspDiagnosticsDefaultHint' }
)
vim.fn.sign_define(
    'LspDiagnosticsSignInformation',
    { texthl = 'LspDiagnosticsDefaultInformation', text = '', numhl = 'LspDiagnosticsDefaultInformation' }
)

-- Symbols to show in the text when the lsp provides diagnostics
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    virtual_text = true,
})

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    '   (Text) ',
    '   (Method)',
    '   (Function)',
    '   (Constructor)',
    ' ﴲ  (Field)',
    '[] (Variable)',
    '   (Class)',
    ' ﰮ  (Interface)',
    '   (Module)',
    ' 襁 (Property)',
    '   (Unit)',
    '   (Value)',
    ' 練 (Enum)',
    '   (Keyword)',
    '   (Snippet)',
    '   (Color)',
    '   (File)',
    '   (Reference)',
    '   (Folder)',
    '   (EnumMember)',
    ' ﲀ  (Constant)',
    ' ﳤ  (Struct)',
    '   (Event)',
    '   (Operator)',
    '   (TypeParam)',
}

local lsp = {}

---@diagnostic disable-next-line: unused-local
lsp.common_on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- lspsaga remaps
    buf_set_keymap('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_set_keymap('v', '<leader>ca', ' :<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    buf_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
    buf_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
    buf_set_keymap('n', '<leader>r', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', opts)
    buf_set_keymap('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)

    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', ':lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>sd', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<leader>ql', ':lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<leader>cf', ':Format<CR>', opts)
end

-- automatically setup these servers with no configuration. I do not bother with these
local servers = { 'html', 'texlab', 'emmet_ls', 'cssls' }
--enable snippet support
local nvim_lsp = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

configs.emmet_ls = {
    default_config = {
        cmd = { 'emmet-ls', '--stdio' },
        filetypes = { 'html' },
        root_dir = function()
            return vim.loop.cwd()
        end,
        settings = {},
    },
}

nvim_lsp.emmet_ls.setup({})
for _, server in ipairs(servers) do
    require('lspconfig')[server].setup({
        on_attach = lsp.common_on_attach,
        capabilities = capabilities,
    })
end

return lsp
