vim.api.nvim_exec([[
        augroup jstsreact
        au!
        au BufWritePost *.js lua vim.lsp.buf.formatting_seq_sync()
        au BufWritePost *.ts lua vim.lsp.buf.formatting_seq_sync()
        au BufWritePost *.tsx lua vim.lsp.buf.formatting_seq_sync()
        au BufWritePost *.jsx lua vim.lsp.buf.formatting_seq_sync()
        augroup END
]],false)
