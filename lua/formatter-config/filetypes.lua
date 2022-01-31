local lua = require("formatter-config.lua")
local rust = require("formatter-config.rust")
local python = require("formatter-config.python")
local javascript = require("formatter-config.javascript")

return {
	javascript = javascript,
	typescript = javascript,
	typescriptreact = javascript,
	javascriptreact = javascript,
	rust = rust,
	lua = lua,
	python = python,
}
