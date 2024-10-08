--- Creates an autocommand with the given group, event, pattern, and callback.
--- @param group integer | string
--- @param event string
--- @param pattern string
--- @param callback function | string
--- @return integer
local function create_autocmd(group, event, pattern, callback)
  local id = vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = callback,
  })
  return id
end

--- Creates an autocommand with the given group, event, pattern, and callback.
--- @param name string
--- @return integer
local function create_augroup(name)
  local id = vim.api.nvim_create_augroup(name, { clear = true })
  return id
end

local highlight_group = create_augroup("highlight")
local exit_group = create_augroup("exit")

create_autocmd(highlight_group, "TextYankPost", "*", function() vim.highlight.on_yank({
  timeout = 80,
}) end)

create_autocmd(exit_group, "VimLeavePre", "*", function() os.execute("killall prettierd") end)
