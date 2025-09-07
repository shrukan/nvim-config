return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-cmdline", -- source for cmdline
		"hrsh7th/cmp-nvim-lsp-signature-help", -- source for function signature
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		{ "petertriho/cmp-git", opts = {} }, -- for git
		opts = function(_, opts)
			table.insert(opts.sources, { name = "git" })
		end,
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- loads vscode style snippets from installed plugins
		require("luasnip.loaders.from_vscode").lazy_load()

		-- configure cmdline autocompletion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			-- configure how nvim-cmp interacts with snippet engine
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }), -- previous suggestion
				["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }), -- next suggestion
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- show completion suggestion
				["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" }), -- close completion suggestion
				["<CR>"] = cmp.mapping(
					cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					{ "i" }
				),
				-- confirm with tab, and if no entry is selected, will confirm the first item
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						end
						cmp.confirm()
					else
						fallback()
					end
				end, { "i", "s", "c" }),
			}),

			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- snippets
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "nvim_lsp_signature_help" },
			}),
		})
	end,
}
