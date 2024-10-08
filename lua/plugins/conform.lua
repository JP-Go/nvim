return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      '<leader>cf',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = 'n',
      desc = 'Format buffer',
    },
  },
  -- Everything in opts will be passed to setup()
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      csharp = { 'csharpier' },
      go = { 'gofmt' },
      sh = { 'shfmt' },
      rust = { 'rustfmt' },
      lua = { 'stylua' },
      python = { 'black' },
      javascript = { 'prettierd', 'prettier' ,stop_after_first = true},
      typescript = { 'prettierd', 'prettier' ,stop_after_first = true},
      javascriptreact = { 'prettierd', 'prettier' ,stop_after_first = true},
      typescriptreact = { 'prettierd', 'prettier' ,stop_after_first = true},
      json = { 'prettierd', 'prettier' ,stop_after_first = true},
      html = { 'prettierd', 'prettier' ,stop_after_first = true},
      css = { 'prettierd', 'prettier' ,stop_after_first = true},
      scss = { 'prettierd', 'prettier' ,stop_after_first = true},
      sass = { 'prettierd', 'prettier' ,stop_after_first = true},
      markdown = { 'prettierd', 'prettier' ,stop_after_first = true},
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
