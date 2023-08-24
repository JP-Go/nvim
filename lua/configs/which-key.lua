local wk = require("which-key")

wk.register({
	f = {
		name = "Find",
		f = {"<cmd>Telescope find_files<cr>", "Find Files"},
		w = {"<cmd>Telescope live_grep<cr>", "Find Word"},
	}
}, {prefix = "<leader>"})
