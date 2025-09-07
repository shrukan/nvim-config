return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			delay = 10,
			plugins = {
				presets = {
					z = false,
				},
			},
		})
		wk.add({
			{ "<leader>e", group = "Filesystem" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gt", group = "Toggle" },

			{ "<leader>c", group = "Code" },
			{ "<leader>cc", group = "Calls" },
			{ "<leader>cf", group = "Finder" },
			{ "<leader>ci", group = "Information" },

			{ "<leader>f", group = "Search" },

			{ "<leader>s", group = "Settings" },
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Show local keymaps",
		},
	},
}
