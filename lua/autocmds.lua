vim.api.nvim_exec([[
        augroup formater
        au!
        au BufWritePost *.js,*.ts,*.jsx,*.tsx FormatWrite prettier
        au BufWritePost *.py FormatWrite black
        augroup END
]],false)
