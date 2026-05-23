-- Formatting
Core.add_plugin({ Core.gh('stevearc/conform.nvim') })

---@param bufnr integer
---@param ... string
---@return string
local function first(bufnr, ...)
    local conform = require('conform')
    for i = 1, select('#', ...) do
        local formatter = select(i, ...)
        if conform.get_formatter_info(formatter, bufnr).available then
            return formatter
        end
    end
    return select(1, ...)
end

-- Formatting
require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        javascript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = function(bufnr)
            return { first(bufnr, 'biome', 'prettierd', 'prettier'), 'rustywind' }
        end,
        typecriptreact = function(bufnr)
            return { first(bufnr, 'biome', 'prettierd', 'prettier'), 'rustywind' }
        end,
        go = { 'gofmt' },
    },
    format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
})

Core.add_keymap({ 'n', 'x' }, '<leader>cf', require('conform').format, { desc = 'Run formatter' })
