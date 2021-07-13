local tsserver_on_attach = function(client,bufnr)
  client.resolved_capabilities.document_formatting = false
end

require("lspconfig").tsserver.setup {
  cmd = {
    "typescript-language-server",
    "--stdio"
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  on_attach = tsserver_on_attach,
  root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  settings = { documentFormatting = false },
}

vim.cmd('set ts=4 sts=4 sw=0')
vim.cmd('LspStart')
