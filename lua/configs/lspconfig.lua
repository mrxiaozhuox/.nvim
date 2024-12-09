-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- ignore -32802 error (rust-anaylzer) : this should be a issue from rust_analyzer which not been fix.
for _, method in ipairs { "textDocument/diagnostic", "workspace/diagnostic" } do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    local client = vim.lsp.get_client_by_id(context.client_id)
    if client ~= nil and client.name == "rust_analyzer" then
      if err ~= nil and err.code == -32802 then
        return
      end
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

local servers = { "rust_analyzer", "pyright", "gopls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- php intelephense config
lspconfig["intelephense"].setup {
  settings = {
    intelephense = {
      files = {
        exclude = {
          "**/*.php~",
          "**/.git/**",
        },
      },
    },
  },
}
