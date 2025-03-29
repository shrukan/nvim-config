return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>ee", "<cmd>Neotree left<CR>")
		keymap.set("n", "<leader>ec", "<cmd>Neotree close filesystem<CR>")
		keymap.set("n", "<leader>eb", "<cmd>Neotree buffers right<CR>")
		keymap.set("n", "<leader>ef", "<cmd>Neotree right left reveal_force_cwd<CR>")
		keymap.set("n", "<leader>gs", "<cmd>Neotree float git_status<CR>", { desc = "Git status" })
	end,
}
