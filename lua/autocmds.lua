vim.api.nvim_exec(
    [[
        augroup formater
        au!
        au BufWritePost *.js,*.ts,*.jsx,*.tsx,*.py,*.lua,*.rs,*.R FormatWrite
        augroup END
]],
    false
)
