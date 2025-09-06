return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>e", group = "Filesystem" },

			{ "<leader>g", group = "Git" },
			{ "<leader>gt", group = "Toggle" },

			{ "<leader>c", group = "Code" },
			{ "<leader>ct", group = "Toggle" },

			{ "<leader>t", group = "Toggle" },

			{ "<leader>f", group = "Find" },

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
