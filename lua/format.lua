local common_jsts_conf = {
    function()
        return {
            exe = 'prettier',
            args = {
                '--stdin-filepath',
                vim.api.nvim_buf_get_name(0),
                '--single-quote',
                '--print-width=80',
                '--tab-width=4',
                '--parser=babel-ts',
            },
            stdin = true,
        }
    end,
}

require('formatter').setup({
    logging = false,
    filetype = {
        javascript = common_jsts_conf,
        typescript = common_jsts_conf,
        javascriptreact = common_jsts_conf,
        typescriptreact = common_jsts_conf,
        python = {
            function()
                return {
                    exe = 'black',
                    stdin = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = { '--config-path=/home/jp/.dotfiles/stylua.toml', '-' },
                    stdin = true,
                }
            end,
        },
        rust = {
            function()
                return { exe = 'rustfmt', args = { '--emit=stdout' }, stdin = true }
            end,
        },
    },
})
