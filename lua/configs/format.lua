local M = {}

M.opts = {
  filetype = {
    lua = { require('formatter.filetypes.lua').stylua },
    javascript = { require('formatter.filetypes.javascript').prettier },
    typescript = { require('formatter.filetypes.typescript').prettier },
    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettier,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },
    vue = { require('formatter.filetypes.vue').prettier },
    sql = { require('formatter.filetypes.sql').pg_format },
    go = { require('formatter.filetypes.go').gofmt },
    cs = {
      function()
        return {
          exe = 'dotnet-csharpier',
          stdin = true,
          no_append = false,
        }
      end,
    },
    c = { require('formatter.filetypes.c').clangformat },
    java = { require('formatter.filetypes.java').clangformat },
  },
}

return M
