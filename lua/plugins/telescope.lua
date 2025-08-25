return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({})
        end
    },
    {
        'andrew-george/telescope-themes',
        config = function()
            require('telescope').load_extension('themes')
        end
    },

}
