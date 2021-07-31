local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

require('nvim-autopairs.completion.compe').setup({
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
})

npairs.setup()
npairs.add_rules({
    Rule('$', '$', { 'tex', 'latex' }) -- don't add a pair if the next character is %
        :with_pair(cond.not_after_regex_check('%%')) -- don't add a pair if  the previous character is xxx
        :with_pair(cond.not_before_regex_check('xxx', 3)) -- don't move right when repeat character
        :with_move(cond.none()) -- don't delete if the next character is xx
        :with_del(cond.not_after_regex_check('xx'))
        :with_cr(cond.none()),
    Rule('\\[', '\\]', { 'tex', 'latex' }):with_pair(cond.not_after_regex_check('%%')),
})
