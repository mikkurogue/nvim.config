-- Arch Rust Theme - Highlight Groups
-- Tree-sitter and semantic highlighting support

local M = {}

function M.setup(palette)
  local c = palette
  
  local highlights = {
    -- Editor UI
    Normal = { fg = c.fg0, bg = c.bg0 },
    NormalFloat = { fg = c.fg0, bg = c.bg1 },
    FloatBorder = { fg = c.arch_blue, bg = c.bg1 },
    ColorColumn = { bg = c.bg1 },
    Cursor = { fg = c.bg0, bg = c.fg0 },
    CursorLine = { bg = c.bg1 },
    CursorLineNr = { fg = c.rust_orange, bold = true },
    LineNr = { fg = c.gray0 },
    SignColumn = { fg = c.fg3, bg = c.bg0 },
    VertSplit = { fg = c.bg3 },
    WinSeparator = { fg = c.bg3 },
    Pmenu = { fg = c.fg1, bg = c.bg2 },
    PmenuSel = { fg = c.bg0, bg = c.arch_blue },
    PmenuSbar = { bg = c.bg2 },
    PmenuThumb = { bg = c.bg4 },
    
    -- Statusline
    StatusLine = { fg = c.fg0, bg = c.bg2 },
    StatusLineNC = { fg = c.fg3, bg = c.bg1 },
    
    -- Tabline
    TabLine = { fg = c.fg3, bg = c.bg1 },
    TabLineFill = { bg = c.bg1 },
    TabLineSel = { fg = c.fg0, bg = c.bg3 },
    
    -- Search
    Search = { fg = c.bg0, bg = c.rust_tan },
    IncSearch = { fg = c.bg0, bg = c.rust_orange },
    CurSearch = { fg = c.bg0, bg = c.rust_orange, bold = true },
    
    -- Visual
    Visual = { bg = c.bg3 },
    VisualNOS = { bg = c.bg3 },
    
    -- Diff
    DiffAdd = { fg = c.green, bg = c.bg1 },
    DiffChange = { fg = c.yellow, bg = c.bg1 },
    DiffDelete = { fg = c.red, bg = c.bg1 },
    DiffText = { fg = c.fg0, bg = c.bg3 },
    
    -- Diagnostics
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.rust_orange },
    DiagnosticInfo = { fg = c.arch_blue },
    DiagnosticHint = { fg = c.arch_cyan },
    DiagnosticUnderlineError = { undercurl = true, sp = c.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.rust_orange },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.arch_blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.arch_cyan },
    
    -- Syntax (fallback for non-treesitter)
    Comment = { fg = c.gray0, italic = true },
    Constant = { fg = c.rust_tan },
    String = { fg = c.green },
    Character = { fg = c.green },
    Number = { fg = c.rust_tan },
    Boolean = { fg = c.rust_orange },
    Float = { fg = c.rust_tan },
    
    Identifier = { fg = c.arch_light_blue },
    Function = { fg = c.arch_blue, bold = true },
    
    Statement = { fg = c.rust_orange },
    Conditional = { fg = c.rust_orange },
    Repeat = { fg = c.rust_orange },
    Label = { fg = c.rust_orange },
    Operator = { fg = c.fg2 },
    Keyword = { fg = c.rust_orange, bold = true },
    Exception = { fg = c.rust_red },
    
    PreProc = { fg = c.arch_cyan },
    Include = { fg = c.arch_cyan },
    Define = { fg = c.arch_cyan },
    Macro = { fg = c.arch_cyan },
    PreCondit = { fg = c.arch_cyan },
    
    Type = { fg = c.arch_cyan },
    StorageClass = { fg = c.rust_orange },
    Structure = { fg = c.arch_cyan },
    Typedef = { fg = c.arch_cyan },
    
    Special = { fg = c.rust_orange },
    SpecialChar = { fg = c.rust_tan },
    Tag = { fg = c.arch_blue },
    Delimiter = { fg = c.fg2 },
    SpecialComment = { fg = c.gray0, italic = true },
    Debug = { fg = c.rust_red },
    
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    
    Error = { fg = c.red },
    Todo = { fg = c.bg0, bg = c.rust_orange, bold = true },
    
    -- Tree-sitter highlights
    ["@variable"] = { fg = c.fg0 },
    ["@variable.builtin"] = { fg = c.rust_red },
    ["@variable.parameter"] = { fg = c.rust_tan },
    ["@variable.member"] = { fg = c.arch_light_blue },
    
    ["@constant"] = { fg = c.rust_tan },
    ["@constant.builtin"] = { fg = c.rust_tan },
    ["@constant.macro"] = { fg = c.arch_cyan },
    
    ["@module"] = { fg = c.arch_blue },
    ["@label"] = { fg = c.rust_orange },
    
    ["@string"] = { fg = c.green },
    ["@string.escape"] = { fg = c.rust_tan },
    ["@string.special"] = { fg = c.rust_orange },
    ["@character"] = { fg = c.green },
    ["@character.special"] = { fg = c.rust_tan },
    
    ["@number"] = { fg = c.rust_tan },
    ["@boolean"] = { fg = c.rust_orange },
    ["@float"] = { fg = c.rust_tan },
    
    ["@function"] = { fg = c.arch_blue, bold = true },
    ["@function.builtin"] = { fg = c.arch_cyan },
    ["@function.macro"] = { fg = c.arch_cyan },
    ["@function.method"] = { fg = c.arch_blue },
    
    ["@constructor"] = { fg = c.arch_cyan },
    ["@operator"] = { fg = c.fg2 },
    
    ["@keyword"] = { fg = c.rust_orange, bold = true },
    ["@keyword.function"] = { fg = c.rust_orange },
    ["@keyword.operator"] = { fg = c.rust_orange },
    ["@keyword.return"] = { fg = c.rust_orange, bold = true },
    ["@keyword.conditional"] = { fg = c.rust_orange },
    ["@keyword.repeat"] = { fg = c.rust_orange },
    ["@keyword.import"] = { fg = c.arch_cyan },
    ["@keyword.exception"] = { fg = c.rust_red },
    
    ["@type"] = { fg = c.arch_cyan },
    ["@type.builtin"] = { fg = c.arch_cyan },
    ["@type.definition"] = { fg = c.arch_cyan },
    ["@type.qualifier"] = { fg = c.rust_orange },
    
    ["@attribute"] = { fg = c.arch_cyan },
    ["@property"] = { fg = c.arch_light_blue },
    
    ["@comment"] = { fg = c.gray0, italic = true },
    ["@comment.todo"] = { fg = c.bg0, bg = c.rust_orange, bold = true },
    ["@comment.warning"] = { fg = c.bg0, bg = c.yellow, bold = true },
    ["@comment.note"] = { fg = c.bg0, bg = c.arch_blue, bold = true },
    ["@comment.error"] = { fg = c.bg0, bg = c.red, bold = true },
    
    ["@punctuation.delimiter"] = { fg = c.fg2 },
    ["@punctuation.bracket"] = { fg = c.fg1 },
    ["@punctuation.special"] = { fg = c.rust_orange },
    
    ["@tag"] = { fg = c.arch_blue },
    ["@tag.attribute"] = { fg = c.arch_light_blue },
    ["@tag.delimiter"] = { fg = c.fg2 },
    
    -- Markup (Markdown, etc.)
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.heading"] = { fg = c.arch_blue, bold = true },
    ["@markup.link"] = { fg = c.arch_cyan, underline = true },
    ["@markup.link.url"] = { fg = c.arch_light_blue },
    ["@markup.raw"] = { fg = c.green },
    ["@markup.list"] = { fg = c.rust_orange },
    ["@markup.quote"] = { fg = c.gray0, italic = true },
    
    -- LSP Semantic Tokens
    ["@lsp.type.class"] = { fg = c.arch_cyan },
    ["@lsp.type.decorator"] = { fg = c.arch_cyan },
    ["@lsp.type.enum"] = { fg = c.arch_cyan },
    ["@lsp.type.enumMember"] = { fg = c.rust_tan },
    ["@lsp.type.function"] = { fg = c.arch_blue },
    ["@lsp.type.interface"] = { fg = c.arch_cyan },
    ["@lsp.type.macro"] = { fg = c.arch_cyan },
    ["@lsp.type.method"] = { fg = c.arch_blue },
    ["@lsp.type.namespace"] = { fg = c.arch_blue },
    ["@lsp.type.parameter"] = { fg = c.rust_tan },
    ["@lsp.type.property"] = { fg = c.arch_light_blue },
    ["@lsp.type.struct"] = { fg = c.arch_cyan },
    ["@lsp.type.type"] = { fg = c.arch_cyan },
    ["@lsp.type.typeParameter"] = { fg = c.rust_tan },
    ["@lsp.type.variable"] = { fg = c.fg0 },
    
    -- Git signs
    GitSignsAdd = { fg = c.green },
    GitSignsChange = { fg = c.rust_orange },
    GitSignsDelete = { fg = c.red },
    
    -- Telescope
    TelescopeBorder = { fg = c.arch_blue },
    TelescopePromptBorder = { fg = c.rust_orange },
    TelescopePromptTitle = { fg = c.rust_orange, bold = true },
    TelescopeResultsTitle = { fg = c.arch_blue, bold = true },
    TelescopePreviewTitle = { fg = c.arch_cyan, bold = true },
    TelescopeSelection = { fg = c.fg0, bg = c.bg2, bold = true },
    TelescopeMatching = { fg = c.rust_orange, bold = true },
    
    -- NvimTree
    NvimTreeFolderIcon = { fg = c.arch_blue },
    NvimTreeFolderName = { fg = c.arch_blue },
    NvimTreeOpenedFolderName = { fg = c.arch_light_blue, bold = true },
    NvimTreeRootFolder = { fg = c.rust_orange, bold = true },
    NvimTreeSpecialFile = { fg = c.rust_orange },
    NvimTreeGitDirty = { fg = c.rust_orange },
    NvimTreeGitNew = { fg = c.green },
    NvimTreeGitDeleted = { fg = c.red },
    
    -- WhichKey
    WhichKey = { fg = c.arch_blue },
    WhichKeyGroup = { fg = c.rust_orange },
    WhichKeyDesc = { fg = c.fg1 },
    WhichKeySeparator = { fg = c.gray0 },
    WhichKeyFloat = { bg = c.bg1 },
    
    -- Indent Blankline
    IndentBlanklineChar = { fg = c.bg3 },
    IndentBlanklineContextChar = { fg = c.arch_blue },
    
    -- Cmp (completion)
    CmpItemAbbrMatch = { fg = c.rust_orange, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.rust_tan },
    CmpItemKind = { fg = c.arch_cyan },
    CmpItemMenu = { fg = c.gray0 },
  }
  
  return highlights
end

return M
