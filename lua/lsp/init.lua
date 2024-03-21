return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"folke/which-key.nvim",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			-- import lspconfig plugin
			local lspconfig = require("lspconfig")

			-- import cmp-nvim-lsp plugin
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local keymap = vim.keymap -- for conciseness

			local opts = { noremap = true, silent = true }

			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- if client.config.flags then
				-- 	client.config.flags.allow_incremental_sync = true
				-- end
				--
				-- client.resolved_capabilities.document_formatting = false

				vim.api.nvim_buf_set_option(bufnr, "typescript.enableStrict", true)

				local wk = require("which-key")
				wk.register({}, { prefix = "<leader>" })
			end

			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- configure typescript server with plugin
			lspconfig["tsserver"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})

			-- configure html server
			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			local keymap = vim.keymap -- for conciseness
			local opts = { noremap = true, silent = true }

			require("lspsaga").setup({})

			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

			opts.desc = "Go to definition"
			keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show documentation for what is under cursor

			local wk = require("which-key")
			wk.register({
				c = {
					name = "Code",
					r = { "<cmd>Lspsaga finder ref+imp+def<CR>", "Lsp references" },
					c = { vim.lsp.buf.declaration, "Go to declaration" },
					a = { "<cmd>Lspsaga code_action<CR>", "Lsp code actions" },
					R = { "<cmd>Lspsaga rename<CR>", "Lsp rename" },
				},
				l = {
					name = "LSP",
					l = { vim.diagnostic.open_float, "Line diagnostics" },
					k = { "<cmd>Lspsaga hover_doc<CR>", "Show documentation for waht is under cursor" },
					z = { "<cmd>LspRestart<CR>", "Restart LSP" },
				},

				d = {
					name = "Diagnostic",
					b = {
						"<cmd>lua require('telescope.builtin').diagnostics({layout_strategy='vertical'})<CR>",
						"Buffer diagnostics",
					},
					p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Go to previous diagnostic" },
					n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Got to next diagnostic" },
				},
			}, { prefix = "<leader>" })
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	dependencies = {
	-- 		"nvimtools/none-ls-extras.nvim",
	-- 	},
	-- 	config = function()
	-- 		local null_ls = require("null-ls")
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				require("none-ls.diagnostics.eslint_d"),
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
