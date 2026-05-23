Core.add_autocmd('FileType', {
    pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'go', 'gomod', 'gosum', 'lua' },
    callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

Core.add_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})
