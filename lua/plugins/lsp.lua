return {"neovim/nvim-lspconfig", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", {
    "jay-babu/mason-null-ls.nvim",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {"williamboman/mason.nvim", "nvimtools/none-ls.nvim"},
    config = function()
        require("mason-null-ls").setup({
            automatic_installation = true
        })
    end
}}
