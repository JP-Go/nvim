local neogit_ok, neogit = pcall(require, "neogit")

if not neogit_ok then
	vim.notify("Failed to require neogit")
	return
end

neogit.setup({ kind = "split" })

require("keymaps").set_keymap("n", "<leader>ng", "<cmd>lua require('neogit').open()<CR>", require("keymaps").opts)
