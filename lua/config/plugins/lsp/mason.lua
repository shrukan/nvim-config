return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local has_go = function()
			return vim.fn.executable("go") == 1
		end

		-- list of tools for mason to install
		mason_tool_installer.setup({
			ensure_installed = {
				-- lsp
				"lua-language-server",
				{ "gopls", condition = has_go },
				"typescript-language-server",
				"angular-language-server",
				"html-lsp",
				"css-lsp",
				"taplo",
				"json-lsp",
				"yaml-language-server",
				"emmet-language-server",
				"dockerfile-language-server",
				"docker-compose-language-service",
				"bash-language-server",

				-- formatters
				"prettier", -- web
				"stylua", -- lua
				"shfmt", -- bash
				-- go specific
				{ "gofumpt", condition = has_go },
				{ "gci", condition = has_go }, -- go import order
				{ "golines", condition = has_go }, -- go long lines

				-- linters
				{ "golangci-lint", condition = has_go }, -- go
				"eslint_d", -- web
				"selene", -- lua
				"hadolint", -- dockerfile
				"shellcheck", -- bash
			},

			automatic_installation = true,
		})
	end,
}
