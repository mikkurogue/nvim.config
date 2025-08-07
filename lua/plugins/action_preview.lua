return {
    "aznhe21/actions-preview.nvim",
    config = function()
        vim.keymap.set({ "n", "v" }, "la", require("actions-preview").code_actions)
    end
}
