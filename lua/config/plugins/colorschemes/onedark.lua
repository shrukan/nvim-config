return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	lazy = false,
	config = function()
		require("onedark").setup({
			style = "deep",
			colors = {
				green = "#00bb5a",
				fg = "#b7c6e2",
			},
			highlights = {
				-- Tags
				["@tag"] = { fg = "$red" }, -- Tags like HTML tag names.
				["@tag.builtin"] = { fg = "$red" }, -- JSX tag names.
				["@tag.attribute"] = { fg = "$yellow", style = { "italic" } }, -- XML/HTML attributes (foo in foo="bar").
				["@tag.delimiter"] = { fg = "$dark_red" }, -- Tag delimiter

				["@nospell"] = { fg = "none" },
				["@spell"] = { fg = "none" },
			},
		})
	end,
}
