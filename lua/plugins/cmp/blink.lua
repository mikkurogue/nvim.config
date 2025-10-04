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
    },
  },
}
