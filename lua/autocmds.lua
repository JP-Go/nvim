vim.api.nvim_exec(
    [[
        augroup formater
        au!
        au BufWritePost *.js,*.ts,*.jsx,*.tsx FormatWrite
        au BufWritePost *.py FormatWrite
        au BufWritePost *.lua FormatWrite
        augroup END
]],
    false
)
