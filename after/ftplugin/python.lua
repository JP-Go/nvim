local set_keymap = require("keymaps").set_keymap

set_keymap("n", "<C-p>", "<cmd>lua _PYTHON_TOGGLE()<CR>", { noremap = true })
