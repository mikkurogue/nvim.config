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
vim.opt.number = true
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs

vim.g.mapleader = " "

-- Setup lazy.nvim and install plugins
require("lazy").setup({
	-- Add rose-pine theme
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {},
	},
	{ "echasnovski/mini.nvim", version = false },
	{
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},
	-- Add Neo-tree and its dependencies
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- Ensure this is included
			"MunifTanjim/nui.nvim",
		},
	},
	-- Add nvim-web-devicons
	{ "nvim-tree/nvim-web-devicons" },
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "vim", "vimdoc" },
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{ "luckasRanarison/tailwind-tools.nvim" },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- options here...
		},
	},
	{
		"mg979/vim-visual-multi",
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
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },

			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- Jump to the implementation of the word under your cursor.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- Jump to the type of the word under your cursor.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following autocommand is used to enable inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			local servers = {
				-- clangd = {},
				-- gopls = {},
				-- pyright = {},
				-- rust_analyzer = {},

				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
	"hrsh7th/cmp-path", -- Path source for nvim-cmp
	"hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippet engine
	"saadparwaiz1/cmp_luasnip", -- Snippet source for nvim-cmp
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			background_color = "#000000",
			render = "wrapped-compact",
		},
	},
	"nvim-lua/plenary.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
	},
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
	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
			},
		},
	},
	-- nvim-autopairs for auto-completing brackets
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
		"DreamMaoMao/yazi.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},

		keys = {
			{ "<leader>gy", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
})

-- Set the colorscheme
vim.cmd("colorscheme rose-pine")

-- Configure nvim-cmp and LSP
local cmp = require("cmp")
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

local handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	}),
}

-- Set up LSP servers
lspconfig.gopls.setup({
	capabilities = capabilities,
	settings = {
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
	},
	handlers = handlers,
})

local function organise_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end
		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Key mappings
		local opts = { noremap = true, silent = true }
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		-- Organize imports on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.ts,*.tsx",
			callback = function()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
					title = "",
				}
				vim.lsp.buf.execute_command(params)
			end,
		})

		-- Other LSP mappings and settings...
		-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		-- Add other key mappings as needed
	end,
	capabilities = capabilities,
	handlers = handlers,
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	commands = {
		Organise = {
			organise_imports,
			description = "Organise imports",
		},
	},
})

-- setup lsp for c++
lspconfig.clangd.setup({
	cmd = { "clangd", "--background-index" },
	filetypes = { "c", "cpp", "obj", "objcpp" },
	root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "compile_flags.txt"),
})

-- Set up lspconfig.
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	handlers = handlers,
	on_attach = function(client, bufnr)
		-- Keybindings and other setup for Rust Analyzer can go here
		-- Example keybinding setup
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		keymap(bufnr, "n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		keymap(bufnr, "n", "<leader>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		keymap(bufnr, "n", "<leader>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		keymap(bufnr, "n", "<leader>wl", "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		keymap(bufnr, "n", "<leader>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
		keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap(bufnr, "n", "<leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		keymap(bufnr, "n", "<leader>e", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		keymap(bufnr, "n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		keymap(bufnr, "n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
		keymap(bufnr, "n", "<leader>q", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	end,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

lspconfig.emmet_language_server.setup({
	filetypes = {
		"css",
		"eruby",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"pug",
		"typescriptreact",
	},
	-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
	-- **Note:** only the options listed in the table are supported.
	init_options = {
		---@type table<string, string>
		includeLanguages = {},
		--- @type string[]
		excludeLanguages = {},
		--- @type string[]
		extensionsPath = {},
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
		preferences = {},
		--- @type boolean Defaults to `true`
		showAbbreviationSuggestions = true,
		--- @type "always" | "never" Defaults to `"always"`
		showExpandedAbbreviation = "always",
		--- @type boolean Defaults to `false`
		showSuggestionsAsSnippets = false,
		--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
		syntaxProfiles = {},
		--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
		variables = {},
	},
})

-- lspconfig.vtsls.setup{
--   capabilities = capabilities,
--   settings = {},
-- }
require("mini.move").setup()
-- Configure Neo-tree
require("neo-tree").setup({
	-- Neo-tree configuration
	close_if_last_window = false, -- Keep Neo-tree open
	filesystem = {
		follow_current_file = true, -- Automatically open the tree when entering a new buffer
		visible = true,
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

-- Open Neo-tree automatically on startup
vim.cmd("autocmd VimEnter * Neotree show")
