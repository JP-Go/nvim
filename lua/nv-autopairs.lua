local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local complete_function = function()
    local ft = vim.api.nvim_buf_get_option(0, 'filetype')
    return ft ~= 'tex'
end

require('nvim-autopairs.completion.compe').setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = complete_function(), -- it will auto insert `(` after select function or method item
    enable_check_bracket_line = false,
})

npairs.setup()
npairs.add_rules({
    Rule('$', '$', { 'tex', 'latex' }) -- don't add a pair if the next character is %
        :with_pair(cond.not_after_regex_check('%%')) -- don't add a pair if  the previous character is xxx
        :with_pair(cond.not_before_regex_check('xxx', 3)) -- don't move right when repeat character
        :with_move(cond.none()) -- don't delete if the next character is xx
        :with_del(cond.not_after_regex_check('xx'))
        :with_cr(cond.none()),
    Rule('\\[', '\\]', 'tex'):with_pair(function(opts)
        print(vim.inspect(opts))
        if opts.line == 'aa \\[' then
            -- don't add pair on that line
            return false
        end
    end),
})
