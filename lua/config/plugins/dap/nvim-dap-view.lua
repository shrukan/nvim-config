return {
	{
		"igorlfs/nvim-dap-view",
		lazy = false,
		---@module 'dap-view'
		---@type dapview.Config
		opts = {},
		keys = {
			{
				"<leader>dv",
				function()
					require("dap-view").toggle()
				end,
				desc = "Toggle view",
			},
			{
				"<leader>dw",
				"<cmd>DapViewWatch<cr>",
				desc = "Watch expression",
				mode = { "n", "v" },
			},
			{
				"<leader>dW",
				":DapViewWatch ",
				desc = "Watch custom expression",
				mode = { "n" },
			},
		},
	},
}
