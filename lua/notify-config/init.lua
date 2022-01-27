local notify_ok, notify = pcall(require, "notify")
if not notify_ok then
  vim.notify("Failed to require nvim-notify", vim.log.levels.WARN)
  return
end

notify.setup({
  stages = "fade",
  timeout = 1000,
  minimum_width = 24,
})

vim.notify = notify
