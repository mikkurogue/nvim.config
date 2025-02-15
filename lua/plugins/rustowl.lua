return {
	{
		"cordx56/rustowl",
		dependencies = { "neovim/nvim-lspconfig" },
		build = "cd rustowl && cargo install --path . --locked && cargo clean",
		ft = { "rust" },
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.rustowlsp.setup({})
		end,
	},
}
