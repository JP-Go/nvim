Core.add_plugin({ Core.gh('sontungexpt/better-diagnostic-virtual-text') })

Core.add_autocmd('LspAttach', {
    pattern = { 'go', 'lua', 'gomod', 'gosum', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
    callback = function()
        require('better-diagnostic-virtual-text').setup()
    end,
})

Core.add_plugin({ Core.gh('OXY2DEV/markview.nvim') })

require('markview').setup()

Core.add_plugin({ Core.gh('chrisgrieser/nvim-rulebook') })

Core.add_plugin({ Core.gh('ofirgall/ofirkai.nvim') })

require('ofirkai').setup({})

vim.cmd.colorscheme('ofirkai')

Core.add_plugin({ Core.gh('akinsho/bufferline.nvim') })

require('bufferline').setup({
    highlights = require('ofirkai.tablines.bufferline').highlights, -- Must
    options = { -- Optional, recommended
        themable = true, -- Must
        separator_style = 'slant',
        offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } },
        show_buffer_icons = true,
        numbers = 'ordinal',
        max_name_length = 40,
    },
})

Core.add_plugin({ Core.gh('b0o/incline.nvim'), Core.gh('nvim-tree/nvim-web-devicons') })
local helpers = require('incline.helpers')
local navic = require('nvim-navic')
local devicons = require('nvim-web-devicons')
require('incline').setup({
    window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
    },
    render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        if filename == '' then
            filename = '[No Name]'
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local res = {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            guibg = '#44406e',
        }
        if props.focused then
            for _, item in ipairs(navic.get_data(props.buf) or {}) do
                table.insert(res, {
                    { ' > ', group = 'NavicSeparator' },
                    { item.icon, group = 'NavicIcons' .. item.type },
                    { item.name, group = 'NavicText' },
                })
            end
        end
        table.insert(res, ' ')
        return res
    end,
})
