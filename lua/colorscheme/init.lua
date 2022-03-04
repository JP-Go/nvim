-- TODO: Find a way to set these options when the colorscheme changes
local handlers = require("colorscheme.handlers")
local colorscheme = "tokyonigh"

local options = handlers.get_colorscheme_options(colorscheme)

local theme = "auto"
if not options then
  vim.cmd("colorscheme " .. colorscheme) -- Just set the scheme
  handlers.set_statusline_theme(theme)
  return
end

-- Set all options and colorscheme after
theme = options.theme
handlers.set_colorscheme_vars(options)
handlers.set_statusline_theme(theme)
if options.mappings then
  options.mappings()
end
if options.callback then
  options.callback()
end

vim.cmd("colorscheme " .. colorscheme)

--bufferline
local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
  vim.notify("Failed to require bufferline", vim.log.levels.WARN)
  return
end

bufferline.setup()
