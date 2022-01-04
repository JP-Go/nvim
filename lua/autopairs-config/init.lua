local autopairs_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_ok then
    vim.notify('Failed to require nvim-autopairs', vim.log.levels.WARN)
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string', 'source' },
        javascript = { 'string', 'template_string' },
        java = false,
    },
    disable_filetype = { 'TelescopePrompt' },
    fast_wrap = {
        map = '<A-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
        offset = 0, -- Offset from pattern match
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
    },
})

local cmp_autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_ok then
    vim.notify('Failed to require nvim_autopairs.completion.cmp', vim.log.levels.WARN)
    return
end
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    vim.notify('Failed to require cmp', vim.log.levels.WARN)
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '{' } }))
