local tree_status_ok, tree = pcall(require, 'nvim-tree')

if not tree_status_ok then
    vim.notify('Failed to require nvim-tree', vim.log.levels.WARN)
    return
end

tree.setup()
