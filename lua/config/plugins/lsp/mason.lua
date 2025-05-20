return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- list of lsp servers for mason to install
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"gopls",
				"ts_ls",
				"cssls",
				"taplo",
				"jsonls",
				"yamlls",
				"dockerls",
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})

		-- list of formatter servers for mason to install
		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"prettier",
				"stylua", -- lua
				"gofumpt", -- go
				"gci", -- go import order
				"golines", -- go long lines

				-- linters
				"golangci-lint", -- go
				"eslint_d", -- js
				"selene", -- lua
			},

			automatic_installation = true,
		})
	end,
}
