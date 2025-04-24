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

wk.add({{
    "<leader><leader>f",
    group = "Find"
}, {
    "<leader><leader>ft",
    "<cmd>Telescope find_files<cr>",
    desc = "Find Files"
}, {
    "<leader><leader>g",
    group = "Git"
}, {
    "<leader><leader>gs",
    "<cmd>LazyGit<cr>",
    desc = "Lazygit"
}, {
    "<leader><leader>l",
    group = "LSP"
}, {
    "<leader><leader>la",
    vim.lsp.buf.code_action,
    desc = "Code Action"
}, {
    "<leader><leader>lf",
    vim.lsp.buf.rename,
    desc = "Format Code"
}, {
    "<leader><leader>lr",
    vim.lsp.buf.rename,
    desc = "Rename Symbol"
}, {
    "<leader><leader>q",
    "<cmd>q<cr>",
    desc = "Quit"
}, {
    "<leader><leader>t",
    group = "Theme"
}, {
    "<leader><leader>w",
    "<cmd>w<cr>",
    desc = "Save"
}}, {
    prefix = "<leader>"
})