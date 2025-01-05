-- Think of a better keybind than leader m
-- probably better to keybind this with split kb and thumbclusters tbh

return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<Leader>m",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {},
}
