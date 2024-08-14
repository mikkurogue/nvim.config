require("config.options")
require("config.keymaps")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and install plugins
require("lazy").setup({
	spec = {
		{
			import = "plugins",
		},
	},
})

-- Set the colorscheme
vim.cmd("colorscheme rose-pine")

require("plugins.lsp.config")

-- lspconfig.vtsls.setup{
--   capabilities = capabilities,
--   settings = {},
-- }
require("mini.move").setup()
-- Configure Neo-tree
require("neo-tree").setup({
	-- Neo-tree configuration
	close_if_last_window = true,
	filesystem = {
		follow_current_file = true, -- Automatically open the tree when entering a new buffer
		visible = false,
		filtered_items = {
			visible = true,
			show_hidden_count = true,
			hide_dotfiles = false,
		},
	},
	window = {
		width = 30,
		position = "left",
		mappings = {
			["<space>"] = "none", -- Disable space keybinding
		},
	},
})

require("lualine").setup()

-- Open Neo-tree automatically on startup
vim.cmd("autocmd VimEnter * Neotree show")
