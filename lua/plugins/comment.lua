return {{
    'echasnovski/mini.comment',
    version = false,
    dependencies = {'JoosepAlviste/nvim-ts-context-commentstring'},
    config = function()
        -- Ensure ts-context-commentstring is correctly configured
        require('ts_context_commentstring').setup({
            enable_autocmd = false
        })

        require('mini.comment').setup({
            options = {
                custom_commentstring = function()
                    return vim.bo.commentstring
                end
            }
        })

        -- Set filetype-specific comment strings
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {'typescriptreact', 'javascriptreact'},
            callback = function()
                vim.bo.commentstring = '{/* %s */}'
            end
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
