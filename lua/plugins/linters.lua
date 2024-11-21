return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            typescript = { 'eslint_d' },
            javascript = { 'eslint_d' },
        }
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
            callback = function()
                require('lint').try_lint()
            end,
        })
    end,
    event = { 'LspAttach' },
}
