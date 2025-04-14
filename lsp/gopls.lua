return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = function(buf, cb)
        local root = vim.fs.root(buf, 'go.mod')
        if root then
            return cb(root)
        end
        root = vim.fs.root(buf, 'go.work')
        if root then
            return cb(root)
        end
        return cb(nil)
    end,
    single_file_support = true,
}
