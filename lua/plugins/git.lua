return {
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
		keys = {
			{
				"<leader>gg",
				"<cmd>Neogit<cr>",
				mode = "n",
				desc = "Open git panel",
			},
		},
	},
}
