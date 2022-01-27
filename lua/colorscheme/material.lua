local material_options = {
  italics = { comments = true },
  contrast_filetypes = { "terminal", "packer", "qf", "NvimTree" },
  disable = { borders = true },
}

return {
  vars = {
    material_style = "deep ocean",
  },
  mappings = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>mc",
      "<cmd>lua require('material.functions').toggle_style()<CR>",
      { noremap = true }
    )
  end,
  callback = function()
    require("material").setup(material_options)
  end,
}
