vim.api.nvim_exec([[
        augroup jstsreact
        au!
        au BufWritePost *.js,*.ts,*.jsx,*.tsx FormatWrite prettier
        augroup END
]],false)
