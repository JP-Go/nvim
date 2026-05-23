--- Core - core functions module
Core = {
    __loaded_plugins = {},
}
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

--- add_autocmd - adds a new auto command to the editor
--- @help see vim.api.nvim_create_autocmd (:h vim.api.nvim_create_autocmd)
local add_autocmd = function(...)
    vim.api.nvim_create_autocmd(...)
end

--- load_module - Load a module. If there's an error, logs failure
--- @param module_path string path for the plugin
local load_module = function(module_path)
    if Core.__loaded_plugins[module_path] then
        vim.notify('Module ' .. module_path .. ' already loaded', vim.log.levels.INFO)
        return
    end
    local ok, _ = pcall(require, module_path)
    if not ok then
        vim.notify('Failed to load module ' .. module_path, vim.log.levels.ERROR)
    end
    Core.__loaded_plugins[module_path] = true
end

Core.gh = gh
Core.load_module = load_module
Core.add_plugin = add_plugin
Core.add_keymap = add_keymap
Core.add_autocmd = add_autocmd
