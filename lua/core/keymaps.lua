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

map("n", "<leader>/", "gcc", { noremap = true, silent = true, desc = "Toggle comment line" })
map("v", "<leader>/", "gcc", { noremap = true, silent = true, desc = "Toggle comment block" })  

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

vim.keymap.set("n", "<leader>th", ":Telescope themes<CR>", {
    noremap = true,
    silent = true,
    desc = "Theme Switcher"
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
map("n", "<leader>Ss", function()
    require("persistence").load()
end)

-- select a session to load
map("n", "<leader>Sf", function()
    require("persistence").select()
end)
