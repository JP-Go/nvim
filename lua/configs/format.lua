local M = {}

M.opts = {
  filetype = {
    lua = { require('formatter.filetypes.lua').stylua },
    javascript = { require('formatter.filetypes.javascript').denofmt },
    typescript = { require('formatter.filetypes.typescript').denofmt },
    javascriptreact = { require('formatter.filetypes.javascriptreact').denofmt },
    typescriptreact = { require('formatter.filetypes.typescriptreact').denofmt },
    vue = { require('formatter.filetypes.vue').prettier },
  },
}

return M
