local treesitter_config_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not treesitter_config_ok then
  vim.notify("Failed to require nvim-treesitter.config", vim.log.levels.WARN)
  return
end

treesitter_config.setup({
  ensure_installed = {
    "python",
    "scss",
    "tsx",
    "typescript",
    "javascript",
    "cpp",
    "c",
    "fortran",
    "make",
    "json",
    "bash",
    "lua",
    "latex",
    "html",
  },
  highlight = {
    enable = true,
    -- disable = { "latex" },
  },
})

-- Use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_ok then
  vim.notify("Failed to require nvim-ts-autotag", vim.log.levels.WARN)
  return
end

autotag.setup()
