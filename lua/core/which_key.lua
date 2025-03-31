local wk = require("which-key")

wk.setup({
    plugins = {
        spelling = {
            enabled = false
        }
    },
    window = {
        border = "rounded",
        position = "bottom"
    }
})

wk.register({
    ["<leader>"] = {
        t = {
            name = "Theme"
        },
        f = {
            name = "Find",
            t = {"<cmd>Telescope find_files<cr>", "Find Files"}
        },
        g = {
            name = "Git",
            s = {"<cmd>LazyGit<cr>", "Lazygit"}
        },
        l = {
            name = "LSP",
            a = {vim.lsp.buf.code_action, "Code Action"},
            r = {vim.lsp.buf.rename, "Rename Symbol"},
            f = {vim.lsp.buf.format, "Format Code"}
        },
        q = {"<cmd>q<cr>", "Quit"},
        w = {"<cmd>w<cr>", "Save"}
    }
}, {
    prefix = "<leader>"
})
