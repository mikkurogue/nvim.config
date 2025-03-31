return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"lua", "rust", "typescript", "javascript", "go"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
            autotag = {
                enable = true
            }
        })
    end
}
