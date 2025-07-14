return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
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

			opts.desc = "References"
			keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references initial_mode=normal<CR>", opts) -- show definition, references

			opts.desc = "Toggle inlay hints"
			keymap.set("n", "<leader>ch", toggle_inlay_hints, opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Go to definition"
			keymap.set("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Implementations"
			keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations initial_mode=normal<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "Available actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- show available code actions

			opts.desc = "Rename"
			keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts) -- show rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>cbd", "<cmd>Telescope diagnostics bufnr=0 initial_mode=normal<CR>", opts) -- show diagnostis for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>cld", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "<leader>ce", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary
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
					experimentalPostfixCompletions = true,
					analyses = {
						unusedparams = true,
						shadow = true,
					},
					hints = {
						rangeVariableTypes = true,
						parameterNames = true,
						constantValues = true,
						assignVariableTypes = true,
						compositeLteralFields = true,
						compositeLiteralTypes = true,
						functionTypeParameters = true,
					},
					staticcheck = true,
					semanticTokens = true,
				},
			},
			init_options = {
				usePlaceholders = false,
			},
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

		lspconfig["cssls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
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
