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
				"marksman",

				-- formatters
				"prettier", -- web
				"stylua", -- lua
				"shfmt", -- bash

				-- linters
				"eslint_d", -- web
				"selene", -- lua
				"hadolint", -- dockerfile
				"shellcheck", -- bash

				-- formatter/linters
				{ "golangci-lint", condition = has_go }, -- go
				"rumdl",
			},

			automatic_installation = true,
		})
	end,
}
