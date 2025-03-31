vim.g.mapleader = " "
local map = vim.keymap.set

-- Code actions (Quick fixes) on <leader>la
map("n", "<leader>la", function()
    vim.lsp.buf.code_action()
end, {
    noremap = true,
    silent = true,
    desc = "Code actions"
})

-- Show diagnostics for current line
map("n", "<leader>ld", function()
    vim.diagnostic.open_float(nil, {
        focusable = false,
        border = "rounded",
        scope = "line"
    })
end, {
    noremap = true,
    silent = true,
    desc = "Show Line Diagnostics"
})

-- Show all diagnostics in open buffers using Telescope
map("n", "<leader>lD", "<cmd>Telescope diagnostics<cr>", {
    noremap = true,
    silent = true,
    desc = "Show All Diagnostics"
})

-- toggle lua.plugins.colorscheme
local themes = {"tokyonight", "catppuccin", "nightfox", "rose-pine", "carbonfox"}

map("n", "<leader>th", function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local conf = require("telescope.config").values

    pickers.new({}, {
        prompt_title = "Select Colorscheme",
        finder = finders.new_table(themes),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
            map("i", "<CR>", function(bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(bufnr)
                vim.cmd("colorscheme " .. selection[1])
                require("core.theme").save_theme(selection[1])
            end)
            return true
        end
    }):find()
end, {
    noremap = true,
    silent = true,
    desc = "Select a theme"
})

map("n", "<leader>w", ":w<CR>", {
    noremap = true,
    silent = true,
    desc = "Save current buffer"
})
map("n", "<leader>q", ":q<CR>", {
    noremap = true,
    silent = true,
    desc = "Quit"
})

map("i", "<C-s>", "<Esc>:w<CR>", {
    noremap = true,
    silent = true,
    desc = "Save from insert mode and back to normal"
})
-- eg binds
map("n", "<leader>ff", ":Telescope find_files<CR>", {
    noremap = true,
    silent = true,
    desc = "Find files with telescope"
})

-- Live Grep (Search for words in project)
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", {
    noremap = true,
    silent = true,
    desc = "Live Grep"
})

map("n", "<leader>fb", ":Telescope buffers<CR>", {
    noremap = true,
    silent = true,
    desc = "Find files with telescope"
})

map("n", "<leader>tf", ":ToggleTerm<CR>", {
    noremap = true,
    silent = true,
    desc = "Toggle floating terminal"
})
map("n", "<leader>gg", ":LazyGit<CR>", {
    noremap = true,
    silent = true,
    desc = "Open Git interface"
})

-- Close current buffer
map("n", "<leader>c", "<cmd>bd<cr>", {
    noremap = true,
    silent = true,
    desc = "Close Current Buffer"
})

