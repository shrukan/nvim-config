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
					package_uninstalled = "✗"
				}
			}
		})

		-- list of lsp servers for mason to install
		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"gopls",
				"taplo",
				"jsonls",
				"yamlls",
				"golangci_lint_ls"
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})

		-- list of formatter servers for mason to install
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"gofumpt", -- go formatter

				"golangci-lint",
				"selene", -- lua linter
			},

			automatic_installation = true,
		})
	end,
}
