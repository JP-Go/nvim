return {
    'codota/tabnine-nvim',
    build = './dl_binaries.sh',
    config = function()
        require('tabnine').setup({
            disable_auto_comment = true,
            debounce_ms = 800,
            exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
        })
    end,
}
