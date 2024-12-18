return {
    {
        'lewis6991/gitsigns.nvim',
        config = true,
        opts = {
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
        },
    },
    { 'echasnovski/mini-git', version = '*', main = 'mini.git', config = true },
}
