local wk = require("which-key")

wk.register({
	f = {
		name = "Find",
		f = {"<cmd>Telescope find_files<cr>", "Find files"},
		w = {"<cmd>Telescope live_grep<cr>", "Find word"},
		h = {"<cmd>Telescope help_tags<cr>", "Find gelp"},
		b = {"<cmd>Telescope buffers<cr>", "Find buffers"},
	},
    b = {
        n = {"<cmd>bNext<cr>","Next buffer"},
        p = {"<cmd>bprev<cr>","Previous buffer"},
        c = {"<cmd>bdelete<cr>","Delete buffer"},
        C = {"<cmd>bdelete!<cr>","Delete buffer (force)"},
    },
    e = {"<cmd>NvimTreeToggle<cr>", "Toggle file tree"},
    ["ss"] = {"<cmd>so%<cr>","Source current file"},
}, {prefix = "<leader>"})
