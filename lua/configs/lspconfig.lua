-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = { "html", "cssls", "tsserver", "gopls", "clangd" }
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

local function organise_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

-- typescript server
lspconfig.tsserver.setup({
	on_attach = function(client, bufnr)
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
	end,
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

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
