local null_ls_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_ok then
    vim.notify('Failed to require null-ls', vim.log.levels.WARN)
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({
            extra_args = {
                '--single-quote',
                '--print-width=80',
                '--tab-width=2',
            },
        }),
        formatting.stylua.with({ extra_args = { '--config-path=/home/jp/.dotfiles/stylua.toml', '-' } }),
        formatting.black,
        formatting.clang_format,
        formatting.format_r,
        formatting.rustfmt,
    },
})
