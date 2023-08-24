local wk = require("which-key")

wk.register({
	f = {
		name = "Find",
		f = {"<cmd>Telescope find_files<cr>", "Find Files"},
		w = {"<cmd>Telescope live_grep<cr>", "Find Word"},
		h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
	},
    e = {"<cmd>NvimTreeToggle<cr>", "Toggle File-tree"},
    ["ss"] = {"<cmd>so%<cr>","Source file"},
}, {prefix = "<leader>"})

