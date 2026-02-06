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
      php = { 'pint' },
      javascript = { 'biome', 'biome-organize-imports', 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'biome', 'biome-organize-imports', 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'biome', 'biome-organize-imports', 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'biome', 'biome-organize-imports', 'prettierd', 'prettier', stop_after_first = true },
      json = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
      html = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
      css = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
      scss = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
      sass = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'biome', 'prettierd', 'prettier', stop_after_first = true },
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
