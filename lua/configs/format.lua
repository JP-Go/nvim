local M = {}

M.opts = {
  filetype = {
    lua = { require('formatter.filetypes.lua').stylua },
    javascript = { require('formatter.filetypes.javascript').denofmt },
    typescript = { require('formatter.filetypes.typescript').denofmt },
    javascriptreact = { require('formatter.filetypes.javascriptreact').denofmt },
    typescriptreact = { require('formatter.filetypes.typescriptreact').denofmt },
    vue = { require('formatter.filetypes.vue').prettier },
    sql = { require('formatter.filetypes.sql').pg_format },
    go = { require('formatter.filetypes.go').gofmt },
    cs = { require('formatter.filetypes.cs').clangformat },
    c = { require('formatter.filetypes.c').clangformat },
    java = { require('formatter.filetypes.java').clangformat },
  },
}

return M
