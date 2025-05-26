return {
    'aspeddro/gitui.nvim',
    config = function()
        require("gitui").setup()
        -- vim.api.nvim_set_keymap("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
}
