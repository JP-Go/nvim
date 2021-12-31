local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
    vim.notify('Failed to require lualine', vim.log.levels.WARN)
    return
end

lualine.setup({
    options = {
        theme = 'gruvbox-material',
    },
})
