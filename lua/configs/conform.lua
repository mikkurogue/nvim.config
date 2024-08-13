local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
  },

  format_after_save = {
    lsp_fallback = true
  },

   format_on_save = {
    -- These options will be passed to conform.format()
     timeout_ms = 9999999,
     lsp_fallback = true,
   },
}

return options
