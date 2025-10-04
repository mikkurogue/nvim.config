return {
  {
    "saghen/blink.cmp",
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = {
          "select_next",
          "fallback",
        },
        ["<S-Tab>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },
        ["<C-j>"] = {
          "accept", -- First try to accept any selected completion item from blink menu
          -- function(cmp) -- Then try sidekick NES
          --   if require("sidekick").nes_jump_or_apply() then
          --     return true -- stop the chain if sidekick handled it
          --   end
          --   -- If sidekick didn't handle it, continue to next in chain
          -- end,
          function(cmp) -- Then try copilot if visible
            local ok, copilot = pcall(require, "copilot.suggestion")
            if ok and copilot.is_visible() then
              copilot.accept()
              return true -- stop the chain
            end
          end,
          "snippet_forward", -- Try snippet forward
          "fallback", -- Finally fallback to default behavior
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "󰊕",
          Function = "󰊕",
          Constructor = "󰒓",
          Field = "󰜢",
          Variable = "󰆦",
          Class = "󰠱",
          Interface = "󰠱",
          Module = "󰅩",
          Property = "󰜢",
          Unit = "󰪚",
          Value = "󰦨",
          Enum = "󰦨",
          Keyword = "󰻾",
          Snippet = "󰩫",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          EnumMember = "󰦨",
          Constant = "󰏿",
          Struct = "󰠱",
          Event = "󱐋",
          Operator = "󰪚",
          TypeParameter = "󰬛",
        },
      },
    },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      
      -- Set custom highlight colors with Arch Linux blue
      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#282828" })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#1793D1", fg = "#FFFFFF", bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#1793D1" })
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#282828" })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#1793D1" })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = "#282828" })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = "#1793D1" })
    end,
  },
}
