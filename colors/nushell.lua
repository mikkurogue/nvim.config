-- File: nushell.lua
-- Pure black background version matching NuShell terminal

local cmd = vim.cmd
local hl = vim.api.nvim_set_hl

vim.g.colors_name = 'nushell'

-- Updated colors with pure black background
local colors = {
  black       = '#181818',  -- Pure black like NuShell
  dark_gray   = '#1a1a1a',  -- Darker gray for better contrast
  gray        = '#4d4d4d',
  light_gray  = '#999999',
  white       = '#e6e6e6',
  red         = '#e13238',  -- Adjusted red to match NuShell better
  light_red   = '#ff6b6b',
  green       = '#4e9a06',  -- More terminal-like green
  light_green = '#8ae234',
  yellow      = '#c4a000',  -- Gold-like yellow
  light_yellow= '#fce94f',
  blue        = '#3399ff',  -- Deeper blue
  light_blue  = '#729fcf',
  magenta     = '#75507b',
  light_magenta='#ad7fa8',
  cyan        = '#06989a',  -- More vibrant cyan
  light_cyan  = '#34e2e2',
  orange      = '#ce5c00',
  light_orange= '#fcaf3e',
}

-- Clear existing highlights
cmd('highlight clear')
if vim.fn.exists('syntax_on') then
  cmd('syntax reset')
end

-- Basic highlighting with pure black background
hl(0, 'Normal',       { fg = colors.white, bg = colors.black })
hl(0, 'NormalFloat',  { fg = colors.white, bg = colors.dark_gray }) -- Floating windows
hl(0, 'Comment',      { fg = colors.gray, italic = true })

-- Syntax groups
hl(0, 'Constant',     { fg = colors.light_cyan })
hl(0, 'String',       { fg = colors.light_green })
hl(0, 'Character',    { fg = colors.light_green })
hl(0, 'Number',       { fg = colors.light_cyan })
hl(0, 'Boolean',      { fg = colors.magenta })
hl(0, 'Float',        { fg = colors.light_cyan })

hl(0, 'Identifier',   { fg = colors.light_blue })
hl(0, 'Function',     { fg = colors.blue })

hl(0, 'Statement',    { fg = colors.magenta })
hl(0, 'Conditional',  { fg = colors.magenta })
hl(0, 'Repeat',       { fg = colors.magenta })
hl(0, 'Label',        { fg = colors.light_blue })
hl(0, 'Operator',     { fg = colors.light_gray })
hl(0, 'Keyword',      { fg = colors.light_magenta })
hl(0, 'Exception',    { fg = colors.red })

hl(0, 'PreProc',      { fg = colors.light_yellow })
hl(0, 'Include',      { fg = colors.light_yellow })
hl(0, 'Define',       { fg = colors.light_yellow })
hl(0, 'Macro',        { fg = colors.light_yellow })
hl(0, 'PreCondit',    { fg = colors.light_yellow })

hl(0, 'Type',         { fg = colors.light_blue })
hl(0, 'StorageClass', { fg = colors.light_magenta })
hl(0, 'Structure',    { fg = colors.light_magenta })
hl(0, 'Typedef',      { fg = colors.light_magenta })

hl(0, 'Special',      { fg = colors.light_blue })
hl(0, 'SpecialChar',  { fg = colors.yellow })
hl(0, 'Tag',          { fg = colors.light_red })
hl(0, 'Delimiter',    { fg = colors.light_gray })
hl(0, 'SpecialComment',{ fg = colors.gray, italic = true })
hl(0, 'Debug',        { fg = colors.red })

-- UI Elements
hl(0, 'Underlined',   { underline = true })
hl(0, 'Ignore',       { fg = colors.gray })
hl(0, 'Error',        { fg = colors.white, bg = colors.red })
hl(0, 'Todo',         { fg = colors.black, bg = colors.yellow, bold = true })

hl(0, 'ColorColumn',  { bg = colors.dark_gray })
hl(0, 'Cursor',       { fg = colors.black, bg = colors.white })
hl(0, 'CursorLine',   { bg = colors.dark_gray })
hl(0, 'CursorLineNr', { fg = colors.yellow, bg = colors.dark_gray })
hl(0, 'LineNr',       { fg = colors.gray })
hl(0, 'CursorColumn', { bg = colors.dark_gray })
hl(0, 'Directory',    { fg = colors.blue })
hl(0, 'ErrorMsg',     { fg = colors.red, bg = colors.black })
hl(0, 'VertSplit',    { fg = colors.dark_gray, bg = colors.black })
hl(0, 'Folded',       { fg = colors.gray, bg = colors.dark_gray })
hl(0, 'FoldColumn',   { fg = colors.gray, bg = colors.dark_gray })
hl(0, 'SignColumn',   { fg = colors.gray, bg = colors.black })
hl(0, 'MatchParen',   { bg = colors.dark_gray, bold = true })
hl(0, 'ModeMsg',      { fg = colors.white })
hl(0, 'MoreMsg',      { fg = colors.green })
hl(0, 'NonText',      { fg = colors.gray })
hl(0, 'Pmenu',        { fg = colors.white, bg = colors.dark_gray })
hl(0, 'PmenuSel',     { fg = colors.black, bg = colors.blue })
hl(0, 'PmenuSbar',    { bg = colors.dark_gray })
hl(0, 'PmenuThumb',   { bg = colors.gray })
hl(0, 'Question',     { fg = colors.green })
hl(0, 'Search',       { bg = colors.yellow, fg = colors.black })
hl(0, 'IncSearch',    { bg = colors.light_yellow, fg = colors.black })
hl(0, 'SpecialKey',   { fg = colors.gray })
hl(0, 'SpellBad',     { undercurl = true, sp = colors.red })
hl(0, 'SpellCap',     { undercurl = true, sp = colors.blue })
hl(0, 'SpellLocal',   { undercurl = true, sp = colors.cyan })
hl(0, 'SpellRare',    { undercurl = true, sp = colors.magenta })
hl(0, 'StatusLine',   { fg = colors.white, bg = colors.dark_gray })
hl(0, 'StatusLineNC', { fg = colors.gray, bg = colors.dark_gray })
hl(0, 'TabLine',      { fg = colors.gray, bg = colors.dark_gray })
hl(0, 'TabLineFill',  { bg = colors.dark_gray })
hl(0, 'TabLineSel',   { fg = colors.white, bg = colors.black })
hl(0, 'Title',        { fg = colors.light_blue })
hl(0, 'Visual',       { bg = colors.dark_gray })
hl(0, 'VisualNOS',    { bg = colors.dark_gray })
hl(0, 'WarningMsg',   { fg = colors.yellow })
hl(0, 'WildMenu',     { fg = colors.black, bg = colors.blue })

-- LSP and diagnostics
hl(0, 'DiagnosticError', { fg = colors.red })
hl(0, 'DiagnosticWarn',  { fg = colors.yellow })
hl(0, 'DiagnosticInfo',  { fg = colors.blue })
hl(0, 'DiagnosticHint',  { fg = colors.light_gray })
hl(0, 'LspReferenceText',   { bg = colors.dark_gray })
hl(0, 'LspReferenceRead',    { bg = colors.dark_gray })
hl(0, 'LspReferenceWrite',   { bg = colors.dark_gray })

-- Treesitter improvements
hl(0, '@variable',            { fg = colors.white })
hl(0, '@variable.builtin',    { fg = colors.light_blue })
hl(0, '@property',            { fg = colors.light_cyan })
hl(0, '@parameter',           { fg = colors.light_orange })
hl(0, '@namespace',           { fg = colors.light_blue })
hl(0, '@text',                { fg = colors.white })
hl(0, '@text.strong',         { bold = true })
hl(0, '@text.emphasis',       { italic = true })
hl(0, '@text.underline',      { underline = true })
hl(0, '@text.strike',         { strikethrough = true })
hl(0, '@text.title',          { fg = colors.light_blue, bold = true })
hl(0, '@text.literal',        { fg = colors.light_green })
hl(0, '@text.reference',      { fg = colors.light_magenta })
hl(0, '@text.uri',            { fg = colors.blue, underline = true })

-- Make floating windows and popups look better with dark background
hl(0, 'FloatBorder',          { fg = colors.gray, bg = colors.dark_gray })