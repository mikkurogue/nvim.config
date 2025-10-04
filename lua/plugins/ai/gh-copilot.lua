return {
  "github/copilot.vim",
  enabled = false, -- Disabled in favor of copilot.lua
  init = function()
    -- Disable default Tab mapping for copilot.vim
    vim.g.copilot_no_tab_map = true
    -- Disable default keymaps
    vim.g.copilot_assume_mapped = true
  end,
  config = function()
    -- Map Control-Space to accept copilot suggestion
    vim.keymap.set('i', '<C-Space>', 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
      silent = true,
    })
  end,
}
