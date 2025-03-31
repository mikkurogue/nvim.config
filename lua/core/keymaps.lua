vim.g.mapleader = " "
local map = vim.keymap.set

-- Code actions (Quick fixes) on <leader>la
map("n", "<leader>la", function()
    vim.lsp.buf.code_action()
end, {
    noremap = true,
    silent = true
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
    silent = true
})

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

map("i", "<C-s>", "<Esc>:w<CR>")

-- eg binds
map("n", "<leader>ff", ":Telescope find_files<CR>", {
    noremap = true,
    silent = true
})
map("n", "<leader>tf", ":ToggleTerm<CR>", {
    noremap = true,
    silent = true
})
map("n", "<leader>gg", ":LazyGit<CR>", {
    noremap = true,
    silent = true
})
