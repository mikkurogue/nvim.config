vim.api.nvim_set_keymap("n", "F", ":Fzf files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "B", ":Fzf buffers<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "T", ":Neotree toggle<CR>", { noremap = true, silent = true })
