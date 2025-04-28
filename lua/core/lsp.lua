local M = {}

function M.setup()
    local lspconfig = require("lspconfig")
    local servers = {"ts_ls", "rust_analyzer", "lua_ls", "pyright", "gopls", "eslint"}

    -- Get blink.cmp capabilities
    local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Common on_attach function
    local on_attach = function(client, bufnr)
        -- Your keybindings here
        local opts = {
            buffer = bufnr,
            remap = false
        }
    end

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true
    })

    -- Setup each LSP server with proper capabilities
    for _, server in ipairs(servers) do
        local config = {
            capabilities = capabilities,
            on_attach = on_attach
        }

        -- Server-specific configurations
        if server == "lua_ls" then
            config.settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim"}
                    }
                }
            }
        end

        lspconfig[server].setup(config)
    end

    -- Keep your diagnostic config
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true
    })
end

return M
