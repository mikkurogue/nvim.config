local M = {}

function M.setup()
    local lspconfig = require("lspconfig")
    local servers = { "ts_ls", "rust_analyzer", "lua_ls", "gopls", "eslint", "biome", "harper_ls" }

    -- Get blink.cmp capabilities
    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = false
    })

    -- -- Setup each LSP server with proper capabilities
    -- for _, server in ipairs(servers) do
    --     lspconfig[server].setup({})
    -- end
    --
    -- Keep your diagnostic config
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true
    })
end

return M
