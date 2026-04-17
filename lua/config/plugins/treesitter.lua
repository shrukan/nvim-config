return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			event = "BufReadPost",
			opts = function()
				return { mode = "cursor", max_lines = 3 }
			end,
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },

			-- ensure that all parser are installed sequentially (used in image)
			sync_install = true,
			ensure_installed = {
				"go",
				"gomod",
				"gosum",
				"gowork",
				"lua",
				"python",
				"javascript",
				"typescript",
				"angular",
				"html",
				"css",
				"scss",
				"json",
				"yaml",
				"sql",
				"dockerfile",
				"git_config",
				"gitcommit",
				"git_rebase",
				"gitignore",
				"gitattributes",
				"make",
				"markdown",
				"markdown_inline",
				"bash",
				"regex",
				"templ",
				"vim",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
