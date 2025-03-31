local M = {}

local theme_file = vim.fn.stdpath("config") .. "/theme.json"

-- Save the selected theme
function M.save_theme(theme)
    local file = io.open(theme_file, "w")
    if file then
        file:write(theme)
        file:close()
    end
end

-- Load the saved theme
function M.load_theme()
    local file = io.open(theme_file, "r")
    if file then
        local theme = file:read("*all")
        file:close()
        return theme
    end
    return "tokyonight" -- Default theme
end

-- Apply the saved theme
function M.apply_theme()
    local theme = M.load_theme()
    vim.cmd("colorscheme " .. theme)
end

return M
