return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	lazy = false,
	config = function()
		require("onedark").setup({
			style = "deep",
		})
	end,
}
