local handlers = require("lsp.handlers")
local capabilities = handlers.common_capabilities
capabilities.textDocument.formatting = true

return {
  capabilities = capabilities,
}
