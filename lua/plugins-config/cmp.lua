local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")

local border_opts = {
	border = "single",
	winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

cmp.setup {
	-- Load snippet support.
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- Completion settings.
	completion = {
		keyword_length = 2
	},

	formatting = {
		fields = { "abbr", "menu", "kind" },
		format = lspkind_status_ok and lspkind.cmp_format(lspkind) or nil
	},

	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered(border_opts),
	},

	-- Key mapping.
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		-- Tab mapping.
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end
	},

	-- Load sources, see: https://github.com/topics/nvim-cmp
	sources = cmp.config.sources {
		{ name = "nvim_lsp", priority = 1000 },
		{ name = "luasnip",  priority = 750 },
		{ name = "buffer",   priority = 500 },
		{ name = "path",     priority = 250 },
	}, }
