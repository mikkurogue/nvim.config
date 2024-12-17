-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	-- import/override with your plugins folder
	{ import = "astrocommunity.recipes.telescope-nvchad-theme" },
	{ import = "astrocommunity.colorscheme.catppuccin" },
	{ import = "astrocommunity.diagnostics.trouble-nvim" },
	{ import = "astrocommunity.utility.hover-nvim" },
	-- { import = "astrocommunity.scrolling.mini-animate" },
	-- { import = "astrocommunity.lsp.lsp-signature-nvim" },
}
