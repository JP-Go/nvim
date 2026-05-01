local core = require("core")

-- Mason
core.add_plugin({ core.gh("mason-org/mason.nvim"), core.gh("mason-org/mason-lspconfig.nvim") })

require("mason").setup()
require("mason-lspconfig").setup()

-- Mini surround + autopairs
core.add_plugin({ {src = core.gh("nvim-mini/mini.surround"), version = "stable"}, {src = core.gh("nvim-mini/mini.pairs"), version = "stable"} })

require("mini.surround").setup()
require("mini.pairs").setup()
