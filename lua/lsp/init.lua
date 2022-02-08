local handlers = require("lsp.handlers")
local servers = handlers.servers

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("Failed to require lspconfig", vim.log.levels.WARN)
  return
end

handlers.setup()
for _, server in ipairs(servers) do
  local options = {
    on_attach = handlers.common_on_attach,
    capabilities = handlers.common_capabilities,
  }
  local has_specifc_configs, specific_server_configs = pcall(require, string.format("lsp.settings.%s", server))
  if has_specifc_configs then
    options = vim.tbl_deep_extend("force", options, specific_server_configs)
  end

  lspconfig[server].setup(options)
end

require("null-ls-config")
