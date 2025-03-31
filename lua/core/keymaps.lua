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

vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })

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

-- load the session for the current directory
vim.keymap.set("n", "<leader>Ss", function()
    require("persistence").load()
end)

-- select a session to load
vim.keymap.set("n", "<leader>Sf", function()
    require("persistence").select()
end)


local map = vim.keymap.set

-- Enhanced Go to Definition
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>",
    { noremap = true, silent = true, desc = "Go to Definition (Telescope)" })
