return {
    "aznhe21/actions-preview.nvim",
    config = function()
        vim.keymap.set({ "n", "v" }, "la", require("actions-preview").code_actions)
        require("actions-preview").setup {
            backend = { "snacks" },

            snacks = {
                layout = { preset = "default" },
            },
        }
    end
}
