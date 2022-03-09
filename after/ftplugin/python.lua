local keymaps = require("keymaps")

keymaps.set_keymap("n", "<C-p>", "<cmd>lua _PYTHON_TOGGLE()<CR>", keymaps.opts)
