-- Arch Rust Theme - Main Theme Module

local M = {}

function M.load()
  -- Reset highlighting
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Set color name
  vim.g.colors_name = "archrust"
  
  -- Set terminal colors
  vim.o.termguicolors = true
  
  -- Load palette and highlights
  local palette = require("archrust.palette")
  local highlights = require("archrust.highlights").setup(palette)
  
  -- Apply highlights
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
  
  -- Set terminal colors
  vim.g.terminal_color_0 = palette.bg0
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.arch_blue
  vim.g.terminal_color_5 = palette.purple
  vim.g.terminal_color_6 = palette.arch_cyan
  vim.g.terminal_color_7 = palette.fg0
  vim.g.terminal_color_8 = palette.gray0
  vim.g.terminal_color_9 = palette.rust_orange
  vim.g.terminal_color_10 = palette.green
  vim.g.terminal_color_11 = palette.rust_tan
  vim.g.terminal_color_12 = palette.arch_light_blue
  vim.g.terminal_color_13 = palette.magenta
  vim.g.terminal_color_14 = palette.cyan
  vim.g.terminal_color_15 = palette.fg0
end

return M
