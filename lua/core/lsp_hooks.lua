local add_lsp_keymaps = function(bufnr)
    local wk = require('which-key')
    wk.add({
        {
            '<leader>ca',
            function()
                vim.lsp.buf.code_action()
            end,
            desc = 'Code actions',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>fs',
            '<cmd>Telescope lsp_workspace_symbols<cr>',
            desc = 'Find Symbols',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>fr',
            function()
                vim.lsp.buf.references()
            end,
            desc = 'Find References',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>fd',
            '<cmd>Trouble diagnostics<cr>',
            desc = 'Find Diagnostics',
            buffer = bufnr,
            remap = true,
        },
        {
            '<leader>r',
            function()
                vim.lsp.buf.rename()
            end,
            desc = 'Rename symbol',
            buffer = bufnr,
            remap = true,
        },
        {
            'gd',
            function()
                vim.lsp.buf.definition()
            end,
            desc = 'Go to definition',
            buffer = bufnr,
            remap = true,
        },
        {
            'gD',
            function()
                vim.lsp.buf.declaration()
            end,
            desc = 'Go to declaration',
            buffer = bufnr,
            remap = true,
        },
        {
            'gr',
            function()
                vim.lsp.buf.references()
            end,
            desc = 'Go to references',
            buffer = bufnr,
            remap = true,
        },
        {
            'K',
            function()
                vim.lsp.buf.hover()
            end,
            desc = 'Hover docs',
            buffer = bufnr,
            remap = true,
        },
    })
end

local on_attach = function(client, bufnr)
    add_lsp_keymaps(bufnr)
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true
end
local capabilities = require('blink.cmp').get_lsp_capabilities()

return {
    on_attach = on_attach,
    capabilities = capabilities,
}
