return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integration = {
				cmp = true,
				gitsigns = true,
				telescope = true,
				treesitter = true,
				which_key = true,
				mason = true,
			},
		})
	end,
}
