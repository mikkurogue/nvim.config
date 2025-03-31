local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {function(server_name)
    require('lspconfig')[server_name].setup {
        capabilities = capabilities
        -- Other server-specific settings
    }
end}
