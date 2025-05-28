-- colors/oxidize.lua

local palette = {
    bg        = "#1e1e2e",
    bg_alt    = "#2a2a3c",
    fg        = "#dcd7ba",
    comment   = "#6c7086",
    keyword   = "#d65d0e",
    type      = "#6ca4c6",
    string    = "#e0af68",
    arch_blue = "#1793d1",
    error     = "#e06c75",
    warning   = "#d19a66",
}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local function load()
    set_hl("Normal", { fg = palette.fg, bg = palette.bg })
    set_hl("Comment", { fg = palette.comment, italic = true })
    set_hl("Keyword", { fg = palette.keyword, bold = true })
    set_hl("Function", { fg = palette.fg })
    set_hl("Identifier", { fg = palette.fg })
    set_hl("Type", { fg = palette.type, italic = true })
    set_hl("Constant", { fg = palette.arch_blue, italic = true })
    set_hl("String", { fg = palette.string })
    set_hl("Error", { fg = palette.error, underline = true, bold = true })
    set_hl("WarningMsg", { fg = palette.warning, underline = true })
    set_hl("LineNr", { fg = palette.comment })
    set_hl("CursorLineNr", { fg = palette.arch_blue, bold = true })
    set_hl("Visual", { bg = palette.bg_alt })
    set_hl("Pmenu", { fg = palette.fg, bg = palette.bg_alt })
    set_hl("PmenuSel", { fg = palette.bg, bg = palette.arch_blue })
    set_hl("StatusLine", { fg = palette.fg, bg = palette.bg_alt })
    set_hl("VertSplit", { fg = palette.bg_alt })
    set_hl("Search", { fg = palette.bg, bg = palette.arch_blue })
    set_hl("@keyword", { link = "Keyword" })
    set_hl("@function", { link = "Function" })
    set_hl("@variable", { link = "Identifier" })
    set_hl("@type", { link = "Type" })
    set_hl("@structure", { link = "Type" })
    set_hl("@constant", { link = "Constant" })
    set_hl("@string", { link = "String" })
    set_hl("@comment", { link = "Comment" })
    set_hl("@error", { link = "Error" })
    set_hl("@warning", { link = "WarningMsg" })
end

load()
