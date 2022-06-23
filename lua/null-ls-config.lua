local nls_ok, nls = pcall(require, "null-ls")
local util = require("vim.lsp.util")

if not nls_ok then
	print("Null-ls not installed")
	return
end

local formatters = nls.builtins.formatting
local formatting_callback = function(client, bufnr)
	vim.keymap.set("n", "<space>cf", function()
		local params = util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, bufnr)
	end, { buffer = bufnr })
end

nls.setup({
	on_attach = function(client, bufnr)
		formatting_callback(client, bufnr)
	end,
	sources = {
		formatters.stylua.with({
			extra_args = { "--config-path=/home/jp/.config/stylua.toml" },
		}),
		formatters.prettierd,
		formatters.black
	},
})
