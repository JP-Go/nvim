local filetype = require("formatter-config.filetypes")
local formatter_ok, formatter = pcall(require, "formatter")

if not formatter_ok then
  vim.notify("Failed to require formatter", vim.log.levels.WARN)
  return
end

formatter.setup({
  filetype = filetype,
})
