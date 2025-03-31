return {{
    'echasnovski/mini.comment',
    version = false,
    config = function()
        require('mini.comment').setup({
            -- No special configuration needed by default
        })

        -- Setup keybindings
        vim.keymap.set('n', '<leader>/', 'gcc', {
            remap = true
        })
        vim.keymap.set('v', '<leader>/', 'gc', {
            remap = true
        })
    end,
    lazy = false
}, {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {}
}}
