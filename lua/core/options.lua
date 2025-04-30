vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.foldenable = true                            -- make sure folds are enabled
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldcolumn = "auto:1"
vim.opt.foldmethod = "expr"                          -- folding, set to "expr" for treesitter based folding
vim.opt.foldtext = ""
vim.opt.foldlevel = 99

vim.opt.fillchars = {
    foldopen = '',
    foldclose = '',
    fold = ' ',    -- filler, optional
    foldsep = ' ', -- separator column filler, optional
}

-- vim.opt.foldlevelstart = 4
-- vim.opt.foldnestmax = 4
