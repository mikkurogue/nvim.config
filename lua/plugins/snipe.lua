return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<o>",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open snipe buffer menu",
		},
	},
	config = function()
		local snipe = require("snipe")
		snipe.setup({
			hints = {
				-- the characters snipe menu will use for navigation to files
				dictionary = "asfghwertyuiopöäå",
			},
			-- close snipe menu
			navigate = {
				cancel_snipe = "q",

				-- close buffer from snipe
				close_buffer = "d",
			},
			sort = "default",
		})
	end,
}
