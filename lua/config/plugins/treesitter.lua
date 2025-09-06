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
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },

			-- ensure that all parser are installed sequentially (used in image)
			sync_install = true,
			-- ensure these language parsers are installed
			ensure_installed = {
				"go",
				"gomod",
				"gosum",
				"gowork",
				"lua",
				"javascript",
				"typescript",
				"angular",
				"html",
				"css",
				"scss",
				"vim",
				"json",
				"yaml",
				"sql",
				"dockerfile",
				"git_config",
				"gitcommit",
				"git_rebase",
				"gitignore",
				"gitattributes",
				"markdown",
				"markdown_inline",
				"bash",
				"regex",
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
