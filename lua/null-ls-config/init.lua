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
    completions.luasnip,
  },
})

local luasnip_ok, luasnip = pcall(require, "luasnip")

if not luasnip_ok then
  vim.notify("Failed to require luasnip", vim.log.levels.WARN)
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

_G.luasnip_jump_forward = function()
  if luasnip.expandable() then
    luasnip.expand()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end

_G.luasnip_jump_backward = function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end

vim.api.nvim_set_keymap("i", "<C-j>", "<cmd>lua _G.luasnip_jump_forward()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<cmd>lua _G.luasnip_jump_backward()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-j>", "<cmd>lua _G.luasnip_jump_forward()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-k>", "<cmd>lua _G.luasnip_jump_backward()<CR>", { noremap = true, silent = true })
