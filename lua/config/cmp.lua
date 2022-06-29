-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')
cmp.setup({
    snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    }),
    formatting = {
		format = lspkind.cmp_format({
			maxwidth = 50,
			mode = "symbol",
			menu = {
				buffer = "BUF",
				rg = "RG",
				nvim_lsp = "LSP",
				path = "PATH",
				luasnip = "SNIP",
				calc = "CALC",
				spell = "SPELL",
			},
		}),
	},
})

