local lspkind = require("lspkind")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.setup({

	mapping = {

		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),

		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "cmp_yanky" },
		{ name = "nvim_lsp_signature_help" },
	}),

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			show_labelDetails = true,
		}),
	},
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
