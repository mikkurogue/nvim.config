require("core.options")
require("core.keymaps")
require("core.autocmds")
require("lazy_setup")

require("core.lsp").setup()
require("core.theme").apply_theme()
require("core.lualine").setup()
require("core.which_key")
