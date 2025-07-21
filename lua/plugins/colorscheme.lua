return {
    { "folke/tokyonight.nvim" },                                -- Multiple styles, good treesitter & LSP support
    { "catppuccin/nvim",                 name = "catppuccin" }, -- Latte, Frappe, Macchiato, Mocha variants
    { "EdenEast/nightfox.nvim" },                               -- Includes nightfox, dayfox, duskfox, etc.
    { "rose-pine/neovim",                name = "rose-pine" },  -- Calming pastel palette
    { "rebelot/kanagawa.nvim" },                                -- Japanese-inspired aesthetic, warm & soft
    { "ellisonleao/gruvbox.nvim" },                             -- Classic, contrasty, works well with Rust
    { "nyoom-engineering/oxocarbon.nvim" },                     -- IBM Carbon inspired, bold and modern
    { "sainnhe/edge" },                                         -- Minimal, supports light/dark & high contrast
    { "Shatur/neovim-ayu" },                                    -- Ayu Light, Mirage, and Dark — very readable
    { "olivercederborg/poimandres.nvim" },                      -- A soothing theme, inspired by VS Code's Poimandres, great for Rust
    { "savq/melange-nvim" },                                    -- Soft earthy tones, great contrast for code-heavy languages like Rust
    { "ramojus/mellifluous.nvim" },                             -- Dark, slightly neon-ish — optimized for readability
    { "projekt0n/github-nvim-theme" },                          -- Several GitHub themes (dark_dimmed is great for Rust)
    { "dasupradyumna/midnight.nvim" },                          -- Deep contrast, works well with Treesitter
    { "AlexvZyl/nordic.nvim" },                                 -- Nord but with fixes and improvements, better for programming
    { "Yazeed1s/minimal.nvim" },                                -- Minimal yet expressive — nice for focused Rust dev
    { "tiagovla/tokyodark.nvim" },                              -- Fusion of Tokyo Night and dark themes, subtly punchy
    { "rmehri01/onenord.nvim" },                                -- Nord variant designed for full Treesitter syntax
    { "rose-pine/neovim",                name = "rose-pine" },  -- Good for meditative coding sessions (already in your list)
    { "kvrohit/mellow.nvim" },                                  -- Minimalist, gentle palette, easy on the eyes
    { "Iron-E/nvim-highlite" },                                 -- Experimental theme engine, allows custom syntax coloring per language
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
