return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			term_colors = true,
			integration = {
				illuminate = true,
				gitsigns = true,
				mason = true,
				neotree = true,
				telescope = {
					enabled = true,
				},
				treesiter = true,
				treesitter_context = true,
				which_key = true,
			},
		})
	end,
}
