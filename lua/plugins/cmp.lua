return { {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
        'onsails/lspkind.nvim' },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    border = 'rounded',
                    scrollbar = false,
                    col_offset = -3,
                    side_padding = 1
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                    border = 'rounded',
                    scrollbar = false
                })
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Get the icon from lspkind
                    local kind_icon = lspkind.symbolic(vim_item.kind, {
                        mode = 'symbol'
                    })
                    vim_item.kind = kind_icon .. " " .. vim_item.kind

                    -- Set a fixed width for the completion text
                    vim_item.abbr = string.sub(vim_item.abbr, 1, 30)

                    -- Extract the module path for imports
                    local menu_text = ""

                    -- From the detail field (often contains module info)
                    if entry.completion_item.detail and entry.completion_item.detail ~= "" then
                        menu_text = entry.completion_item.detail
                    end

                    -- Or from documentation if available
                    if menu_text == "" and entry.completion_item.documentation then
                        local doc = entry.completion_item.documentation
                        if type(doc) == "table" and doc.value then
                            menu_text = doc.value
                        elseif type(doc) == "string" then
                            menu_text = doc
                        end
                    end

                    -- Clean up and truncate the menu text
                    menu_text = menu_text:gsub("\n", " ")
                    if menu_text:len() > 40 then
                        menu_text = menu_text:sub(1, 37) .. "..."
                    end

                    vim_item.menu = menu_text

                    return vim_item
                end
            },
            sources = cmp.config.sources({ {
                name = 'nvim_lsp',
                priority = 1000
            }, {
                name = 'nvim_lsp_signature_help',
                priority = 900
            }, {
                name = 'luasnip',
                priority = 800
            }, {
                name = 'buffer',
                priority = 700
            }, {
                name = 'path',
                priority = 600
            } }),
            mapping = cmp.mapping.preset.insert({
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({
                    select = true
                }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' })
            })
        })
    end
}, {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    config = function()
        -- This will be used in your mason-lspconfig setup
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Your existing LSP config goes here, but with capabilities added
    end
}, }
