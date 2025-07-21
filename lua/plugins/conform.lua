return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "biome" },
                typescript = { "biome" },
                javascriptreact = { "biome" },
                typescriptreact = { "biome" }
            },
            formatters = {
                biome = {
                    command = "biome",
                    args = { "format", "--stdin-file-path", "$FILENAME" },
                    stdin = true,
                },
            },
            format_on_save = {
                pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
                timeout_ms = 10000,
                lsp_fallback = true
            }
        })
    end
}
