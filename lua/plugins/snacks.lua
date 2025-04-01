return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = {
            enabled = false
        },
        dashboard = {
            enabled = true,
            preset = {
                header = table.concat(
                    {"⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀",
                     "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀",
                     "⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠯⠟⠚⢻⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡇",
                     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠿⠟⠛⠋⠉⠁⠀⣠⡆⠀⠈⣿⣿⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢁",
                     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣠⡶⠾⠻⠶⠟⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⡗⠺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈",
                     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣰⠏⢠⣶⠶⢶⣄⣀⣠⣤⣼⣿⢿⣿⣿⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡅⠀⠀",
                     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣀⣠⣿⣤⣿⣷⣶⣿⢿⡟⠉⠁⠀⣿⠀⣿⣿⣿⣿⠇⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⡀⠀",
                     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⠛⠛⠛⣿⠟⢿⣌⣙⣉⣡⡾⠁⠀⠀⠀⣿⠀⢸⣿⣿⣿⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠠⠁⢠",
                     "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠸⣿⠀⠀⠀⠛⠓⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⣟⣀⣠⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⠀⣼",
                     "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣴⣶⣿⡿⠟⠛⣿⣿⣿⡥⣒⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢠⣿",
                     "⠸⣿⣿⣿⣿⣿⣿⣿⣿⣏⣀⣸⣧⣤⣤⣤⣶⣶⣾⡿⠿⠟⠛⠛⠉⠁⠀⢀⡤⠚⢹⣿⣿⡟⣵⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣾⣿",
                     "⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⠿⠿⠭⣉⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠰⢋⣿⡟⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿",
                     "⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⣀⠴⢛⣂⣀⣄⣚⡒⠠⠌⠉⠢⣀⠀⠀⠀⠀⡇⢸⠀⠈⣿⡟⠛⠉⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠸⣿⣿⣿⣿⣿⣿⣿⣯⣤⡞⠋⡟⢰⣿⣻⣝⣿⡶⠄⢲⡈⠀⠀⠀⠀⡇⠈⠢⡀⢹⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿",
                     "⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠈⠳⣄⠘⣾⣛⣿⣿⠿⠛⠉⡸⠁⠀⠀⠀⠀⢠⠀⠀⠙⢾⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣼⣿⣿",
                     "⠀⠀⢹⣿⣿⣿⣿⣿⣿⡇⠀⠀⠚⠋⠹⠛⠉⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠸⠀⠀⠀⠸⠓⢄⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⢸⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⣄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⡀⠀⠀⠀⣀⠄⠀⠀⠀⠀⠀⢸⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⢸⣿⢿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⡸⠀⠀⠀⠀⠀⠀⠉⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⣿⡄⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⠘⣿⣸⣿⣿⣿⣿⡿⣿⣧⣛⡄⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣿⣿⡄⠘⣿⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⣿⣷⡿⣹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠠⠤⠒⠒⠒⠈⠀⡜⠀⣿⣿⣿⡄⠹⣿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⢻⣿⣷⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠐⠉⠁⣀⣀⠤⠄⠒⠃⠀⠀⠃⠀⣿⣿⣿⣷⠀⢿⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⠀⠈⣿⡍⣿⣿⢻⣿⣿⠇⣾⣿⣿⣿⣿⣿⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣇⠈⣿⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⠀⠀⢻⡇⣿⣿⠘⣿⣿⢰⣿⣿⣿⣿⣿⣿⡇⠀⢻⢢⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣞⣿⣿⣿⢿⣿⡆⠸⣿⣿⣿⣿⣿",
                     "⠀⠀⠀⠀⠀⢸⠗⠿⣿⣦⢹⡏⠰⣿⣿⣿⣿⣿⣿⣷⠀⠈⣆⡿⣛⢑⠦⣄⣀⠀⠀⠀⠀⣀⡴⣞⣿⡻⢿⣿⡿⣺⢵⠿⡄⢻⣿⣿⣿⣿"},
                    "\n")
            }
        },
        explorer = {
            enabled = true
        },
        indent = {
            enabled = true
        },
        input = {
            enabled = true
        },
        picker = {
            enabled = true
        },
        notifier = {
            enabled = true,
            timeout = 3000
        },
        scroll = {
            enabled = true
        }
    },
    keys = {{
        "<leader>h",
        function()
            Snacks.dashboard()
        end,
        desc = "Open dashboard"
    }, {
        "<leader>e",
        function()
            Snacks.explorer()
        end,
        desc = "File Explorer"
    }, {
        "<leader>fb",
        function()
            Snacks.picker.buffers()
        end,
        desc = "Buffers"
    }, {
        "<leader>fc",
        function()
            Snacks.picker.files({
                cwd = vim.fn.stdpath("config")
            })
        end,
        desc = "Find Config File"
    }, {
        "<leader>ff",
        function()
            Snacks.picker.files()
        end,
        desc = "Find Files"
    }, {
        "<leader>fw",
        function()
            Snacks.picker.grep()
        end,
        desc = "Live Grep"
    }, {
        "gd",
        function()
            Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition"
    }, {
        "gD",
        function()
            Snacks.picker.lsp_declarations()
        end,
        desc = "Goto Declaration"
    }, {
        "gr",
        function()
            Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References"
    }, {
        "gI",
        function()
            Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation"
    }, {
        "gy",
        function()
            Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition"
    }}
}
