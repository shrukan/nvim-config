return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				go = { "gofumpt", "golines", "goimports", "gci" },
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				htmlangular = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
			},

			format_after_save = {
				async = true,
			},
			-- conform will notify you when no formatters are available for the buffer
			notify_no_formatters = true,
		})

		vim.keymap.set({ "n", "v" }, "<leader>cs", function()
			conform.format({
				lsp_fallback = true,
				async = true,
			})
		end, { desc = "Style/Format file or range (in visual mode)" })
	end,
}
