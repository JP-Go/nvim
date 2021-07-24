local common_jsts_conf = {
   function()
      return {
        exe = "prettier",
        args = {
                "--stdin-filepath", 
                vim.api.nvim_buf_get_name(0),
                '--single-quote',
                '--trailing-comma=all',
                '--print-width=120',
                '--tab-width=4'
            },
        stdin = true
      }
    end
}
    

require('formatter').setup({
  logging = false,
  filetype = {
        javascript = common_jsts_conf,
        typescript = common_jsts_conf,
        javascriptreact = common_jsts_conf,
        typescriptreact = common_jsts_conf,
        python = {
            function()
                return {
                    exe = 'yapf',
                    args = {'-'},
                    stdin=true,
                }
        end
    }
}
})
