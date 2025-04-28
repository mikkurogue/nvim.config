local original_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers { function(server_name)
    require('lspconfig')[server_name].setup {
        capabilities = capabilities
        -- Other server-specific settings
    }
end }
