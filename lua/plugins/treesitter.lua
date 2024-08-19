-- Customize Treesitter

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"typescript",
			"javascript",
			"tsx",
			"json",
			"graphql",
			-- add more arguments for adding more treesitter parsers
		},
	},
}
