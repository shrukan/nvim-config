return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		local lsp_lines = require("lsp_lines")

		vim.diagnostic.config({
			virtual_text = true,
		})

		Virtual_text = true

		lsp_lines.setup(vim.keymap.set("n", "<leader>sd", function()
			lsp_lines.toggle()

			Virtual_text = not Virtual_text

			vim.diagnostic.config({
				virtual_text = Virtual_text,
			})
		end, { desc = "Toggle detailed line diagnostics" }))
	end,
}
