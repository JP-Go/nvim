local treesitter_config_ok, treesitter_config = pcall(require, 'nvim-treesitter.configs')
local autotag_ok, autotag = pcall(require, 'nvim-ts-autotag')

if not treesitter_config_ok then
    vim.notify('Failed to require nvim-treesitter.config')
    return
end

treesitter_config.setup({
    ensure_installed = {
        'python',
        'typescript',
        'rust',
        'cpp',
        'json',
        'bash',
        'lua',
        'java',
        'latex',
    },
})

-- Use treesitter for folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

if not autotag_ok then
    vim.notify('Failed to require nvim-ts-autotag')
    return
end

autotag.setup()
