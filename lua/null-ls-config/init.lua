local null_ls_ok, null_ls = pcall(require, "null-ls")

if not null_ls_ok then
  vim.notify("Failed to require null-ls", vim.log.levels.WARN)
end

local formatting = null_ls.builtins.formatting
local completions = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
  end,
  sources = {
    formatting.stylua.with({ extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") } }),
    formatting.prettier,
    formatting.yapf,
    formatting.latexindent,
    diagnostics.chktex,
    diagnostics.checkmake,
    completions.spell.with({ filetypes = { "tex", "plaintex", "markdown", "txt" } }),
  },
})
