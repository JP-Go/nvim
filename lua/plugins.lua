local core = require("core")
local gh = core.gh
local add_plugin = core.add_plugin
local add_keymap = core.add_keymap

-- Utils
add_plugin({ gh("nvim-lua/plenary.nvim") })

-- Mason
add_plugin({ gh("mason-org/mason.nvim"), gh("mason-org/mason-lspconfig.nvim") })

-- Mini surround + autopairs + files
add_plugin({ 
  {src = gh("nvim-mini/mini.surround"), version = "stable"},
  {src = gh("nvim-mini/mini.pairs"), version = "stable"},
  {src = gh("nvim-mini/mini.files"), version = "stable"},
  {src = gh("nvim-mini/mini.icons"), version = "stable"},
})

-- Lazygit
add_plugin({ gh("kdheepak/lazygit.nvim") })

-- Treesitter
add_plugin({
  { 
    src = gh("nvim-treesitter/nvim-treesitter"), 
    version = 'main' 
  },
})

-- Basic functionalities
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.files").setup()

add_keymap('n','<leader>e', function() MiniFiles.open() end, {desc = "Open files"})

-- Tools and LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "vtsls",
    "gopls"
  },
  automatic_enable = {
    "lua_ls",
    "vtsls",
    "gopls"
  }
})

-- Git
require("lazygit")
add_keymap('n', '<leader>gg', '<cmd>LazyGit<cr>', {desc = "Lazygit"})

-- Treesitter
require("nvim-treesitter").install({
  "javascript",
  "typescript",
  "jsx",
  "tsx",
  "go",
  "gomod",
  "gosum",
  "html",
  "lua"
})
