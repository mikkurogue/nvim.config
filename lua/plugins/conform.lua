return {
    "stevearc/conform.nvim",
    event = {"BufWritePre"},
    cmd = {"ConformInfo"},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = {"prettier"},
                typescript = {"prettier"},
                javascriptreact = {"prettier"},
                typescriptreact = {"prettier"}
            },
            format_on_save = {
                pattern = {"*.js", "*.jsx", "*.ts", "*.tsx"},
                timeout_ms = 500,
                lsp_fallback = true
            }
        })
    end
}
