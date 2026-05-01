-- gh - alias for github repo
local gh = function(repo) return "https://github.com/" .. repo end

-- add_plugin - adds a plugin using the native nvim package manager
local add_plugin = function (config) vim.pack.add(config) end

return {
  gh = gh,
  add_plugin = add_plugin
}
