return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'Kaiser-Yang/blink-cmp-avante' },
    version = '1.*',

    opts = {
      sources = {
        default = {
          'lazydev',
          'avante',
          'lsp',
          'path',
          'buffer',
        },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- options for blink-cmp-avante
            },
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          }
        },
      },
      keymap = { preset = 'enter' },
      completion = {
        menu = { border = 'single' },
        list = {
          selection = {
            preselect = function(ctx)
              return ctx.mode ~= 'cmdline'
            end,
            auto_insert = true,
          },
        },
        documentation = {
          window = { border = 'single' },
        },
      },
      signature = { enabled = true, window = { border = 'single' } },
    },
  },
}
