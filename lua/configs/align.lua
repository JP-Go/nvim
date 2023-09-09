require("which-key").register({
	a = {
		a = {
			function()
				require("align").align_to_char(1, true, true)
			end,
			"Align to char",
		},
	},
}, { prefix = "<leader>", noremap = true, mode = "x" })
