return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {
                'c',
                'lua',
                'vim',
                'vimdoc',
                'query',
                'javascript',
                'typescript',
                'css',
                'html',
                'tsx',
                'vue',
                'prisma',
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = { query = '@function.outer', desc = 'Inside function' },
                        ['if'] = { query = '@function.inner', desc = 'Arround function' },
                        ['ac'] = { query = '@class.outer', desc = 'Arround class' },
                        ['ic'] = { query = '@class.inner', desc = 'Inside class' },

                        ['ab'] = { query = '@block.outer', desc = 'Arround class' },
                        ['ib'] = { query = '@block.inner', desc = 'Inside class' },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']f'] = { query = '@function.outer', desc = 'Next function/method' },
                        [']c'] = { query = '@class.outer', desc = 'Next class' },
                        [']b'] = { query = '@block.outer', desc = 'Next block' },
                    },
                    goto_previous_start = {
                        ['[f'] = { query = '@function.outer', desc = 'Prev function/method' },
                        ['[c'] = { query = '@class.outer', desc = 'Prev class' },
                        ['[b'] = { query = '@block.outer', desc = 'Prev block' },
                    },
                },
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            autotag = {
                enable = true,
            },

            highlight = {
                enable = true,

                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                -- disable = { "c", "rust" },
                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })
    end,
    dependencies = {
        'windwp/nvim-ts-autotag',
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
}
