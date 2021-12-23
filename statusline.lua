local lualine_status_ok, lualine = pcall(require, 'lualine')
if not lualine_status_ok then
    vim.notify('Failed to require lualine')
end

lualine.setup({
    options = {
        component_separators = {
            left = '|',
            right = '|',
        },
        section_separators = {
            left = '',
            right = '',
        },
    },
})
