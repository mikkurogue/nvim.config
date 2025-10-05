return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        dashboard = {
            enabled = true,
            preset = {
                header = table.concat(
                    {
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡟⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡯⣝⠼⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⣱⢮⣙⠾⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⢳⢱⡎⡎⣷⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⡳⢎⡳⢎⣝⡲⢭⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢭⡛⡼⣍⠶⣍⡳⣜⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⡷⣄⡀⠪⣶⣩⠞⣥⠳⣎⢵⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢿⡱⢫⡝⡶⠄⠹⠿⣎⡳⢭⡲⢣⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⢯⢧⣙⢧⣹⢚⡝⢦⠐⣲⢭⠳⣍⡏⣞⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠿⣩⠶⣩⢖⣣⢏⡞⡵⣚⠵⣪⢛⡴⡹⢆⡳⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣏⢻⠴⣫⠵⢮⡱⢞⡼⡱⡭⢞⣱⢫⣜⠳⣭⠳⣍⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡳⢎⡝⡮⣕⢫⠮⣕⣫⡶⠟⠷⢯⣜⣣⢞⣹⠲⡝⣎⡳⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡱⣍⠯⡼⣱⢎⣏⣳⡞⠁⠀⠀⠀⠀⠙⣾⣜⢲⢫⠵⣎⡵⢣⢿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⢷⣱⢎⡹⡶⢇⡾⣆⡿⠀⠀⠀⠀⠀⠀⠀⠸⣇⡏⣇⠿⡰⣉⠏⣎⣹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣏⡳⡜⢮⠵⣍⡏⢶⣽⠇⠀⠀⠀⠀⠀⠀⠀⠀⢿⡜⣎⡳⡕⣤⡈⠊⡵⡻⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡗⢮⣱⢫⡝⡺⣜⠼⣣⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣝⣲⡝⡼⣩⢟⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡻⣜⠳⣬⢓⡞⡵⣪⢝⣲⣿⡤⠀⠀⠀⠀⠀⠀⠀⠀⣼⣞⡴⡹⣜⢣⡞⢦⢫⢟⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⢭⠳⣜⢫⢖⣫⣼⡵⠟⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠓⠯⢾⣼⣩⢳⣚⡴⢫⢷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡾⡝⢮⣝⡮⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠷⣮⣏⢮⢽⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣟⡧⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢮⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠼⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀                 ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    }, "\n"
                ),
            },
            sections = { {
                section = "header"
            }, {
                icon = " ",
                title = "Keymaps",
                section = "keys",
                indent = 2,
                padding = 1
            }, {
                icon = " ",
                title = "Recent Files",
                section = "recent_files",
                indent = 2,
                padding = 1
            },
                {
                    section = "startup"
                } }

        },
        statuscolumn = {
            enabled = true,
            folds = {
                open = true,
                -- git_hl = true,
            },
        },
        explorer = {
            enabled = true,
        },
        -- scroll = {
        --     enabled = true
        -- },
        scope = {
            enabled = true
        },
        notifier = {
            enabled = true,
            timeout = 3000
        },
        picker = {
            enabled = false,
            exclude = { "node_modules", "dist", "out", "target", "release" },

        },
        -- toggle = {
        --     enabled = true,
        --     which_key = true,
        --     notify = true,
        -- },
        win = {
            enabled = true,
        },
        git = {
            enabled = true,     -- this enables git integration
            blame = {
                enabled = true, -- enables blame popups
                delay = 100,    -- optional delay in ms before showing
            }
        },
        indent = {
            enabled = true,
            only_current = true,
            only_scope = true,
            chunk = {
                enabled = true,
                char = {
                    horizontal = '─',
                    vertical = '│',
                    corner_top = '╭',
                    corner_bottom = '╰',
                    arrow = '─',
                },
            }
        },
        bigfile = {
            enabled = true
        } -- check if this needs to be disabled
    },
    keys = { {
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
    },

        {
            "cR",
            function()
                Snacks.rename.rename_file()
            end,
            desc = "Rename current file"
        },

        {
            "uC",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Colorschemes"
        },

        {
            "bc",
            function()
                Snacks.bufdelete()
            end,
            desc = "Close current buffer"
        },

        {
            "bcc",
            function()
                Snacks.bufdelete.all()
            end,
            desc = "Close all buffers"
        },

        {
            "bcC",
            function()
                Snacks.bufdelete.other()
            end,
            desc = "Close all buffers except current"
        },

        {
            "gb",
            function()
                Snacks.git.blame_line()
            end,
            desc = "Open git blame for current line"
        }

    }
}




-- BACK UO ITAHCI ASCII ART
-- header = table.concat(
--                      { "⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀",
-- "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀",
-- "⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠯⠟⠚⢻⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡇",
-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠿⠟⠛⠋⠉⠁⠀⣠⡆⠀⠈⣿⣿⣿⣿⣿⣿⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢁",
-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣠⡶⠾⠻⠶⠟⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⡗⠺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠈",
-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣰⠏⢠⣶⠶⢶⣄⣀⣠⣤⣼⣿⢿⣿⣿⣿⣿⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡅⠀⠀",
-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣀⣠⣿⣤⣿⣷⣶⣿⢿⡟⠉⠁⠀⣿⠀⣿⣿⣿⣿⠇⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⡀⠀",
-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣿⠛⠛⠛⣿⠟⢿⣌⣙⣉⣡⡾⠁⠀⠀⠀⣿⠀⢸⣿⣿⣿⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠠⠁⢠",
-- "⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠸⣿⠀⠀⠀⠛⠓⠛⠛⠛⠉⠁⠀⠀⠀⠀⠀⣟⣀⣠⣿⣿⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⠀⣼",
-- "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⣿⡀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣴⣶⣿⡿⠟⠛⣿⣿⣿⡥⣒⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⢠⣿",
-- "⠸⣿⣿⣿⣿⣿⣿⣿⣿⣏⣀⣸⣧⣤⣤⣤⣶⣶⣾⡿⠿⠟⠛⠛⠉⠁⠀⢀⡤⠚⢹⣿⣿⡟⣵⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣾⣿",
-- "⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⢿⣿⠿⠿⠭⣉⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⡿⠀⠰⢋⣿⡟⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿",
-- "⠀⢸⣿⣿⣿⣿⣿⣿⣿⡇⣀⠴⢛⣂⣀⣄⣚⡒⠠⠌⠉⠢⣀⠀⠀⠀⠀⡇⢸⠀⠈⣿⡟⠛⠉⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠸⣿⣿⣿⣿⣿⣿⣿⣯⣤⡞⠋⡟⢰⣿⣻⣝⣿⡶⠄⢲⡈⠀⠀⠀⠀⡇⠈⠢⡀⢹⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿",
-- "⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠈⠳⣄⠘⣾⣛⣿⣿⠿⠛⠉⡸⠁⠀⠀⠀⠀⢠⠀⠀⠙⢾⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣼⣿⣿",
-- "⠀⠀⢹⣿⣿⣿⣿⣿⣿⡇⠀⠀⠚⠋⠹⠛⠉⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠸⠀⠀⠀⠸⠓⢄⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⢸⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⣄⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⢠⠃⠀⠀⠀⠀⠀⡀⠀⠀⠀⣀⠄⠀⠀⠀⠀⠀⢸⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⢸⣿⢿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⡸⠀⠀⠀⠀⠀⠀⠉⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⣿⡄⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠘⣿⣸⣿⣿⣿⣿⡿⣿⣧⣛⡄⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣿⣿⡄⠘⣿⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⡇⣿⣷⡿⣹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠠⠤⠒⠒⠒⠈⠀⡜⠀⣿⣿⣿⡄⠹⣿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⢻⣿⣷⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠐⠉⠁⣀⣀⠤⠄⠒⠃⠀⠀⠃⠀⣿⣿⣿⣷⠀⢿⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⠈⣿⡍⣿⣿⢻⣿⣿⠇⣾⣿⣿⣿⣿⣿⠢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣇⠈⣿⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⠀⢻⡇⣿⣿⠘⣿⣿⢰⣿⣿⣿⣿⣿⣿⡇⠀⢻⢢⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣞⣿⣿⣿⢿⣿⡆⠸⣿⣿⣿⣿⣿",
-- "⠀⠀⠀⠀⠀⢸⠗⠿⣿⣦⢹⡏⠰⣿⣿⣿⣿⣿⣿⣷⠀⠈⣆⡿⣛⢑⠦⣄⣀⠀⠀⠀⠀⣀⡴⣞⣿⡻⢿⣿⡿⣺⢵⠿⡄⢻⣿⣿⣿⣿" },
--                      "\n")
