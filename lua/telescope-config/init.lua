local telescope_ok, telescope = pcall(require, "telescope")

if not telescope_ok then
  vim.notify("Failed to require telescope", vim.log.levels.WARN)
  return
end

local actions_layout = require("telescope.actions.layout")

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["<C-p>"] = actions_layout.toggle_preview,
      },
      i = {
        ["<C-p>"] = actions_layout.toggle_preview,
      },
    },
  },
})
