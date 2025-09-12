return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		capabilities = {
			textDocument = {
				foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				},
			},
		},
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- toggle inlay hints (start with true)
			vim.lsp.inlay_hint.enable(true)
			local toggle_inlay_hints = function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end

			local keymap = vim.keymap

			opts.desc = "Toggle inlay hints"
			keymap.set("n", "<leader>ch", toggle_inlay_hints, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>sr", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure lua server
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					hint = {
						enable = true,
						setType = true,
						paramType = true,
						paramName = "Enable",
						semicolon = "Enable",
						arrayIndex = "Disable",
					},
					completion = {
						callSnippet = "Replace",
					},
					codeLens = {
						enable = true,
					},
				},
			},
		})

		-- configure go server
		lspconfig["gopls"].setup({
			cmd = { "gopls" },
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					gofumpt = false,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					experimentalPostfixCompletions = true,
					analyses = {
						unusedparams = true,
						unusedwrite = true,
						shadow = true,
						nilness = true,
						useany = true,
					},
					hints = {
						rangeVariableTypes = true,
						parameterNames = true,
						constantValues = true,
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						functionTypeParameters = true,
					},
					staticcheck = true,
					semanticTokens = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					completeUnimported = true,
				},
			},
			init_options = {
				usePlaceholders = false,
			},
		})

		local install_path = vim.fn.stdpath("data") .. "/mason/packages/angular-language-server/node_modules"
		local ang = install_path .. "/@angular/language-server/node_modules"

		local cmd = {
			"ngserver",
			"--stdio",
			"--tsProbeLocations",
			install_path,
			"--ngProbeLocations",
			ang,
		}

		lspconfig["angularls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			root_markers = { "angular.json", "nx.json" },
			on_new_config = function(new_config, _)
				new_config.cmd = cmd
			end,
		})

		-- configure servers for web development
		lspconfig["ts_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			MaxTsServerMemory = 4096,
			preferences = {
				includeInlayParameterTypeHints = "all",
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		})

		lspconfig["html"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["cssls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["emmet_language_server"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"css",
				"eruby",
				"html",
				"htmlangular",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"pug",
				"typescriptreact",
			},
			init_options = {
				showSuggestionsAsSnippets = true,
			},
		})

		-- configure toml server
		lspconfig["taplo"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure json server
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure json server
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure docker server
		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["docker_compose_language_service"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure yaml server
		-- lspconfig["yamlls"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	settings = {
		-- 		yaml = {
		-- 			format = {
		-- 				enable = true,
		-- 			},
		-- 			validate = true,
		-- 			schemaStore = {
		-- 				enable = true,
		-- 			},
		-- 		},
		-- 	},
		-- })
	end,
}
