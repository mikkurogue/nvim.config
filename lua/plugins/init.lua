return {
    {
      "stevearc/conform.nvim",
      -- event = 'BufWritePre', -- uncomment for format on save
      opts = require "configs.conform",
    },
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
    {
      "rebelot/heirline.nvim",  
    },
    { 
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
          return require "configs.mason"
        end,
      },
    {
      "neovim/nvim-lspconfig",
      config = function()
        require "configs.lspconfig"
      end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
          return require "configs.nvimtree"
        end,
      },
      {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        config = function(_, opts)
          dofile(vim.g.base46_cache .. "whichkey")
          require("which-key").setup(opts)
        end,
      },
      {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = function()
          return require "configs.gitsigns"
        end,
      },
      {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
        config = function()
          require("configs.lspconfig").defaults()
        end,
      },
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = function()
          return require "configs.telescope"
        end,
        config = function(_, opts)
          local telescope = require "telescope"
          telescope.setup(opts)
    
          -- load extensions TODO fix this
          -- for _, ext in ipairs(opts.extensions_list) do
          --   telescope.load_extension(ext)
          -- end
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
          return require "configs.treesitter"
        end,
        config = function(_, opts)
          require("nvim-treesitter.configs").setup(opts)
        end,
      },

  
    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
  }