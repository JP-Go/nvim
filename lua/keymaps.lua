local M = {}

M.set_keymap = vim.api.nvim_set_keymap
M.opts = { noremap = true, silent = true }

-- Remappign space as leader key
vim.g.mapleader = " "

-- Source files or lines
M.set_keymap("n", "<leader>x", "<cmd>lua _G.execute_line()<CR>", { noremap = true })
M.set_keymap("n", "<leader><leader>x", "<cmd> source %<CR>", { noremap = true })
-- Source vim file in the current dir for some projects
M.set_keymap("n", "<leader>src", "<cmd> source .vimrc<CR>", { noremap = true })

-- Shift lines in visual mode
M.set_keymap("v", ">", ">gv", M.opts)
M.set_keymap("v", "<", "<gv", M.opts)

-- hlsearch toggle
M.set_keymap("n", "<leader>h", "<cmd>set hlsearch!<CR>", M.opts)

-- Window Navigation normal mode
M.set_keymap("n", "<C-h>", "<C-w>h", M.opts)
M.set_keymap("n", "<C-j>", "<C-w>j", M.opts)
M.set_keymap("n", "<C-k>", "<C-w>k", M.opts)
M.set_keymap("n", "<C-l>", "<C-w>l", M.opts)

-- Delete word to the left of the cursor in ins-mode
-- OBS:  = Ctrl+Backspace
M.set_keymap("i", "", "<C-w>", M.opts)

-- Exit terminal mode
M.set_keymap("t", "<Esc>", "<C-\\><C-N>", M.opts)

-- Cycle trough buffers
M.set_keymap("n", "<S-l>", "<cmd>bnext<CR>", M.opts)
M.set_keymap("n", "<S-h>", "<cmd>bprevious<CR>", M.opts)
M.set_keymap("n", "<leader>q", "<cmd>bdelete<CR>", M.opts)

-- Telescope
M.set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<CR>",
	{ noremap = true }
)
M.set_keymap(
	"n",
	"<leader>lg",
	"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<CR>",
	{ noremap = true }
)
M.set_keymap(
	"n",
	"<leader>ls",
	"<cmd>lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown())<CR>",
	{ noremap = true }
)
M.set_keymap(
	"n",
	"<leader>gr",
	"<cmd>lua require('telescope.builtin').registers(require('telescope.themes').get_dropdown())<CR>",
	{ noremap = true }
)
M.set_keymap(
	"n",
	"gb",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<CR>",
	{ noremap = true }
)

M.set_keymap(
	"n",
	"<A-h>",
	"<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown())<CR>",
	{ noremap = true }
)

-- Nvim Tree
M.set_keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", M.opts)

return M
