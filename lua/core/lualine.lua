local M = {}

function M.setup()
    local theme = require("core.theme").load_theme() -- Load saved theme

    local lualine_theme = theme -- Default to the theme name

    -- If theme isn't directly supported by lualine, map it
    local theme_map = {
        ["tokyonight"] = "tokyonight",
        ["catppuccin"] = "catppuccin",
        ["nightfox"] = "nightfox",
        ["rose-pine"] = "rose-pine"
    }

    if theme_map[theme] then
        lualine_theme = theme_map[theme]
    else
        lualine_theme = "auto" -- Use lualine's auto-detection
    end

    require("lualine").setup({
        options = {
            theme = lualine_theme,
            icons_enabled = true,
            component_separators = {
                left = "│",
                right = "│"
            },
            section_separators = {
                left = "",
                right = ""
            }
        }
    })
end

return M
