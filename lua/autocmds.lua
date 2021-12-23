vim.api.nvim_exec(
    [[
        augroup formater
        au!
        au BufWritePost *.mjs,*.js,*.ts,*.jsx,*.tsx,*.py,*.lua,*.rs,*.R FormatWrite
        augroup END
]],
    false
)
vim.api.nvim_exec(
    [[
        augroup source
        au!
        au BufWritePost plugins.lua source <afile> | PackerSync
        augroup END
]],
    false
)
