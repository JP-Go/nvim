-- Special set of rules for my latex workflow
vim.api.nvim_exec([[
        augroup latex
        au!
        au BufNewFile,BufRead *.tex  set ft=tex wrap tw=100
        au FileType tex lua require('simple-latex')
        augroup END
]],false)
