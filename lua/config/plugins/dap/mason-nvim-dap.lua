return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
	},
	opts = {
		-- This line is essential to making automatic installation work
		handlers = {},
		-- Mason will install these debuggers
		ensure_installed = {
			"delve",
		},
	},
}
