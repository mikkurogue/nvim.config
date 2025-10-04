return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = false, -- Disable direct accept, let blink.cmp handle it
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-CR>",
      },
    },
  },
}
