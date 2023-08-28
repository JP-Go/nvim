local wk = require("which-key")
wk.register({
    g = {
        g = {"<cmd>Neogit kind=vsplit<cr>", "Open neogit" },
        c = {"<cmd>Neogit commit<cr>", "Open new commit" },
        s = {"<cmd>Gitsigns stage_hunk<cr>", "Stage current hunk" },
    },
}, {prefix = '<leader>', noremap = true, silent = true})
