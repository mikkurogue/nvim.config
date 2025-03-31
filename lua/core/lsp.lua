local M = {}

function M.setup()
    local lspconfig = require("lspconfig")
    local servers = {"ts_ls", "rust_analyzer", "lua_ls", "pyright", "gopls", "eslint"} -- Add more as needed

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = servers -- Auto-install these servers
    })

    -- Setup each LSP server
    for _, server in ipairs(servers) do
        lspconfig[server].setup({})
    end

    -- Configure persistent LSP diagnostics
    vim.diagnostic.config({
        virtual_text = true, -- Show inline errors
        signs = true, -- Show signs in the gutter
        underline = true, -- Underline errors in code
        update_in_insert = true -- Keep showing errors in insert mode
    })
end

return M
