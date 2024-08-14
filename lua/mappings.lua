require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "F", ":Fzf files<CR>", { noremap = true, silent = true })
map("n", "B", ":Fzf buffers<CR>", { noremap = true, silent = true })

-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
map("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
