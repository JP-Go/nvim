local common_jsts_conf = {
   function()
      return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote','--use-tabs','--trailing-comma=all'},
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
        typescriptreact = common_jsts_conf
    }
})
