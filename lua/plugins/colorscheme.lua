return {
  {
    "Badacadabra/vim-archery",
    config = function()
      -- Custom color overrides for vim-archery theme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "archery",
        callback = function()
          -- Change MatchParen (bracket match) to a softer blue-gray instead of bright white
          vim.api.nvim_set_hl(0, "MatchParen", { fg = "#25272C", bg = "#81A3CF", bold = true })

          -- Change Cursor to a more visible but not too bright amber color
          vim.api.nvim_set_hl(0, "Cursor", { fg = "#25272C", bg = "#D4A655" })

          -- Change the indent scope (active block indicator) to a darker gray for less eye strain
          -- Softer contrast for colorblind-friendly viewing
          vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#4B5563" })
        end,
      })
    end,
  },
  { "armannikoyan/rusty" },
  {
    "water-sucks/darkrose.nvim",
    lazy = false,
    priority = 1000,
  },
  { "folke/tokyonight.nvim" }, -- Multiple styles, good treesitter & LSP support
  { "catppuccin/nvim", name = "catppuccin" }, -- Latte, Frappe, Macchiato, Mocha variants
  { "EdenEast/nightfox.nvim" }, -- Includes nightfox, dayfox, duskfox, etc.
  { "rebelot/kanagawa.nvim" }, -- Japanese-inspired aesthetic, warm & soft
  { "nyoom-engineering/oxocarbon.nvim" }, -- IBM Carbon inspired, bold and modern
  { "rose-pine/neovim", name = "rose-pine" }, -- Good for meditative coding sessions (already in your list)
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  {
    "olimorris/onedarkpro.nvim",
    name = "onedarkpro",
    priority = 1000,
    config = function()
      require("onedarkpro").setup {
        options = { style = "dark" }, -- use "dark", "onelight", "vivid", etc.
      }
      vim.cmd "colorscheme onedark"
    end,
  },
}
