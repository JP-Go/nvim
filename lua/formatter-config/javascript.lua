return {
  function()
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        vim.fn.fnamescape(vim.api.nvim_buf_get_name(0)),
        "--print-width=90",
        "--tab-width=2",
        "--trailing-comma=all",
      },
      stdin = true,
    }
  end,
}
