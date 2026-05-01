local core = require("core")
local autocmd = core.add_autocmd

autocmd("FileType", {
  pattern = {'javascript',"typescript",'javascriptreact',"typescriptreact",'go',"gomod","gosum",'lua'},
  callback = function() 
    vim.treesitter.start()
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
})
