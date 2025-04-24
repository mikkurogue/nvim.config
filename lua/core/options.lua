vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"                    -- what is this?

vim.opt.foldenable = true                            -- make sure folds are enabled
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldcolumn = "1"
vim.opt.foldmethod = "expr"                          -- folding, set to "expr" for treesitter based folding
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 4
-- vim.opt.foldnestmax = 4
