-- gh - alias for github repo
local gh = function(repo) return "https://github.com/" .. repo end

-- add_plugin - adds a plugin using the native nvim package manager
local add_plugin = function (...) vim.pack.add(...) end

-- add_keymap - adds a new keymap to the editor
local add_keymap = function (...) vim.keymap.set(...) end

-- add_autocmd - adds a new auto command to the editor
local add_autocmd = function (...) vim.api.nvim_create_autocmd(...) end

return {
  gh = gh,
  add_plugin = add_plugin,
  add_keymap = add_keymap,
  add_autocmd = add_autocmd 
}
