-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.number = true

-- Setup lazy.nvim and install plugins
require('lazy').setup({
  -- Add rose-pine theme
  { 'rose-pine/neovim', name = 'rose-pine' },
  -- Add Neo-tree and its dependencies
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- Ensure this is included
      'MunifTanjim/nui.nvim',
    },
  },
  -- Add nvim-web-devicons
  { 'nvim-tree/nvim-web-devicons' },
  { 'nvim-treesitter/nvim-treesitter' },
  'neovim/nvim-lspconfig', -- LSP
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
  'hrsh7th/cmp-buffer', -- Buffer source for nvim-cmp
  'hrsh7th/cmp-path', -- Path source for nvim-cmp
  'hrsh7th/cmp-cmdline', -- Cmdline source for nvim-cmp
  'L3MON4D3/LuaSnip', -- Snippet engine
  'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
  "nvim-lua/plenary.nvim",
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
        },
      })
    end,
  },
  -- nvim-autopairs for auto-completing brackets
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        -- Your custom configuration here, if needed
      })
    end,
  },
  {
    'junegunn/fzf',
    build = ':call fzf#install()',
  },
  {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
  
    keys = {
      { "<leader>gy", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }

})

-- Set the colorscheme
vim.cmd('colorscheme rose-pine')

-- Configure nvim-cmp and LSP
local cmp = require'cmp'
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set up lspconfig.
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {},
  },
}

lspconfig.gopls.setup{
  capabilities = capabilities,
  settings = {
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      compositeLiteralTypes = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
  },
}

lspconfig.vtsls.setup{
  capabilities = capabilities,
  settings = {},
}


-- Configure Neo-tree
require('neo-tree').setup({
  -- Neo-tree configuration
  close_if_last_window = false, -- Keep Neo-tree open
  filesystem = {
    follow_current_file = true, -- Automatically open the tree when entering a new buffer
    visible = true,
    hide_dotfiles = false,
  },
  window = {
    width = 40,
    position = "left",
    mappings = {
      ["<space>"] = "none", -- Disable space keybinding
    },
  },
})

-- Open Neo-tree automatically on startup
vim.cmd('autocmd VimEnter * Neotree show')
