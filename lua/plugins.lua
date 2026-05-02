local core = require("core")
local gh = core.gh
local add_plugin = core.add_plugin
local add_keymap = core.add_keymap

-- Utils
add_plugin({ gh("nvim-lua/plenary.nvim") })

-- Lsp Configs
add_plugin{
  { src = gh('neovim/nvim-lspconfig') },
}

-- Mason
add_plugin({ gh("mason-org/mason.nvim"), gh("mason-org/mason-lspconfig.nvim") })

-- Mini surround + autopairs + files
add_plugin({
  {src = gh("nvim-mini/mini.surround"), version = "stable"},
  {src = gh("nvim-mini/mini.pairs"), version = "stable"},
  {src = gh("nvim-mini/mini.icons"), version = "stable"},
})

-- Lazygit
add_plugin({ gh("kdheepak/lazygit.nvim") })

-- Treesitter
add_plugin({
  {
    src = gh("nvim-treesitter/nvim-treesitter"),
    version = 'main',
  },
})

-- Snacks 
add_plugin({gh("folke/snacks.nvim")})

-- Basic functionalities
require("mini.surround").setup()
require("mini.pairs").setup()

-- Tools and LSP
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "vtsls",
    "gopls"
  },
  automatic_enable = {
    exclude = {
      "lua_ls",
    },
  }
})

vim.lsp.enable("lua_ls")

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

-- Snacks
require('snacks').setup(
   {
    bufdelete = { enabled = true },
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    git = { enabled = true },
    github = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    terminal = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  }
)

-- Top Pickers & Explorer
add_keymap('n',"<leader><space>", function() Snacks.picker.smart() end,{ desc = "Smart Find Files" })
add_keymap('n',"<leader>n", function() Snacks.picker.notifications() end,{ desc = "Notification History" })
add_keymap('n',"<leader>e", function() Snacks.explorer() end,{ desc = "File Explorer" })
add_keymap('n',"<leader>bd", function() Snacks.bufdelete() end,{ desc = "Delete current buffer" })
add_keymap('n',"<C-/>", function() Snacks.terminal() end,{ desc = "Terminal" })
-- find
add_keymap('n',"<leader>fb", function() Snacks.picker.buffers() end,{ desc = "Buffers" })
add_keymap('n',"<leader>ff", function() Snacks.picker.files() end, {desc = "Find Files" })
add_keymap('n',"<leader>fg", function() Snacks.picker.git_files() end, {desc = "Find Git Files" })
add_keymap('n',"<leader>fp", function() Snacks.picker.projects() end, {desc = "Projects" })
add_keymap('n',"<leader>fr", function() Snacks.picker.recent() end, {desc = "Recent" })
-- git
add_keymap('n',"<leader>gb", function() Snacks.picker.git_branches() end,{ desc = "Git Branches" })
add_keymap('n',"<leader>gl", function() Snacks.picker.git_log() end,{ desc = "Git Log" })
add_keymap('n',"<leader>gL", function() Snacks.picker.git_log_line() end,{ desc = "Git Log Line" })
add_keymap('n',"<leader>gs", function() Snacks.picker.git_status() end,{ desc = "Git Status" })
add_keymap('n',"<leader>gS", function() Snacks.picker.git_stash() end,{ desc = "Git Stash" })
add_keymap('n',"<leader>gd", function() Snacks.picker.git_diff() end,{ desc = "Git Diff (Hunks)" })
add_keymap('n',"<leader>gf", function() Snacks.picker.git_log_file() end,{ desc = "Git Log File" })
-- gh
add_keymap('n',"<leader>gi", function() Snacks.picker.gh_issue() end,{ desc = "GitHub Issues (open)" })
add_keymap('n',"<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end,{ desc = "GitHub Issues (all)" })
add_keymap('n',"<leader>gp", function() Snacks.picker.gh_pr() end,{ desc = "GitHub Pull Requests (open)" })
add_keymap('n',"<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,{ desc = "GitHub Pull Requests (all)" })
-- Grep
add_keymap('n',"<leader>sb", function() Snacks.picker.lines() end,{ desc = "Buffer Lines" })
add_keymap('n',"<leader>sB", function() Snacks.picker.grep_buffers() end,{ desc = "Grep Open Buffers" })
add_keymap('n',"<leader>sg", function() Snacks.picker.grep() end,{ desc = "Grep" })
add_keymap({ "n", "x" } ,"<leader>sw", function() Snacks.picker.grep_word() end,{ desc = "Visual selection or word" })
-- LSP
add_keymap('n',"gd", function() Snacks.picker.lsp_definitions() end,{ desc = "Goto Definition" })
add_keymap('n',"gD", function() Snacks.picker.lsp_declarations() end,{ desc = "Goto Declaration" })
add_keymap('n',"gr", function() Snacks.picker.lsp_references() end,{ nowait = true, desc = "References" })
add_keymap('n',"gI", function() Snacks.picker.lsp_implementations() end,{ desc = "Goto Implementation" })
add_keymap('n',"gy", function() Snacks.picker.lsp_type_definitions() end,{ desc = "Goto T[y]pe Definition" })
add_keymap('n',"gai", function() Snacks.picker.lsp_incoming_calls() end,{ desc = "C[a]lls Incoming" })
add_keymap('n',"gao", function() Snacks.picker.lsp_outgoing_calls() end,{ desc = "C[a]lls Outgoing" })
add_keymap('n',"<leader>ss", function() Snacks.picker.lsp_symbols() end,{ desc = "LSP Symbols" })
add_keymap('n',"<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,{ desc = "LSP Workspace Symbols" })

