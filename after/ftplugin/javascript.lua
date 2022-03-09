local keymaps = require("keymaps")

keymaps.set_keymap("n", "<C-p>", "<cmd>lua _NODE_TOGGLE()<CR>", keymaps.opts)
