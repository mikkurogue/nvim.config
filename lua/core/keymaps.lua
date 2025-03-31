vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

map("i", "<C-s>", "<Esc>:w<CR>")

-- eg binds
map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>tf", ":ToggleTerm<CR>", { noremap = true, silent = true })
map("n", "<leader>", ":LazyGit<CR>", { noremap = true, silent = true })