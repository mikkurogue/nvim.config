return {
{
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
},
    { "folke/tokyonight.nvim" },                                -- Multiple styles, good treesitter & LSP support
    { "catppuccin/nvim",                 name = "catppuccin" }, -- Latte, Frappe, Macchiato, Mocha variants
    { "EdenEast/nightfox.nvim" },                               -- Includes nightfox, dayfox, duskfox, etc.
    { "rebelot/kanagawa.nvim" },                                -- Japanese-inspired aesthetic, warm & soft
    { "nyoom-engineering/oxocarbon.nvim" },                     -- IBM Carbon inspired, bold and modern
    { "rose-pine/neovim",                name = "rose-pine" },  -- Good for meditative coding sessions (already in your list)
    { "ellisonleao/gruvbox.nvim",        priority = 1000,    config = true, },
    {
        "olimorris/onedarkpro.nvim",
        name = "onedarkpro",
        priority = 1000,
        config = function()
            require("onedarkpro").setup({
                options = { style = "dark" } -- use "dark", "onelight", "vivid", etc.
            })
            vim.cmd("colorscheme onedark")
        end
    }
}
