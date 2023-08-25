local lspconfig = require("lspconfig")

local add_lsp_keymaps = function(bufnr)
    local wk = require("which-key")
    wk.register({
        ["ca"] = {function() vim.lsp.buf.code_action() end, "Code actions", noremap = false, buffer = bufnr},
        f = {
            s = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Find Symbols", noremap = false, buffer = bufnr},
            r = {function() vim.lsp.buf.references() end, "Find references",noremap = false, buffer = bufnr},
            d = {"Telescope diagnostics", "Find diagnostics", noremap = false, buffer = bufnr},
        },
        r = {function() vim.lsp.buf.rename() end, "Rename symbol",noremap = false, buffer = bufnr},
        g = {
            d = {function() vim.lsp.buf.definition() end, "Go to definition",noremap = false, buffer = bufnr},
            D = {function() vim.lsp.buf.declaration() end, "Go to declaration",noremap = false, buffer = bufnr},
            r = {function() vim.lsp.buf.references() end, "Go to references",noremap = false, buffer = bufnr},
        }
    }, {prefix = "<leader>"})
end


local on_attach = function (client,bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

    add_lsp_keymaps(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    "clangd",
    "cssls",
    "docker_compose_language_service",
    "dockerls",
    "jsonls",
    "lua_ls",
    "prismals",
    "pyright",
    "tailwindcss",
    "tsserver",
    "unocss",
    "volar",
}

for _,server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities
    })
end
