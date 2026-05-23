--- gh - alias for github repo
--- @param repo string the ending part of the repo (username/reponame)
--- @returns the full url of a github repo
local gh = function(repo)
    return 'https://github.com/' .. repo
end

--- add_plugin - adds a plugin using the native nvim package manager
--- @help see vim.pack.add (:h vim.pack.add)
local add_plugin = function(...)
    vim.pack.add(...)
end

-- add_keymap - adds a new keymap to the editor
--- @help see vim.keymap.set (:h vim.keymap.set)
local add_keymap = function(...)
    vim.keymap.set(...)
end

-- add_autocmd - adds a new auto command to the editor
--- @help see vim.api.nvim_create_autocmd (:h vim.api.nvim_create_autocmd)
local add_autocmd = function(...)
    vim.api.nvim_create_autocmd(...)
end

--- Core - global functions
Core = {
    gh = gh,
    add_plugin = add_plugin,
    add_keymap = add_keymap,
    add_autocmd = add_autocmd,
}
