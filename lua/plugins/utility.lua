return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
	},
	{
		"mg979/vim-visual-multi",
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- options here...
		},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = "<date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
			message_when_not_committed = "",
		},
	},
	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
	"hrsh7th/cmp-path", -- Path source for nvim-cmp
	"hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippet engine
	"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				-- Your custom configuration here, if needed
			})
		end,
	},
	{
		"junegunn/fzf",
		build = ":call fzf#install()",
	},
	{
		"ibhagwan/fzf-lua",
		requires = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			background_color = "#000000",
			render = "wrapped-compact",
		},
	},
}
