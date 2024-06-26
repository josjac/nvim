return {
	{
		"mfussenegger/nvim-lint",
		lazy = true,
		-- event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				python = { "pylint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({
				"BufEnter",
				"BufWritePost",
				"InsertLeave",
			}, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			local wk = require("which-key")
			wk.register({
				d = {
					f = {
						function()
							lint.try_lint()
						end,
						"Lintting for current file",
					},
				},
			}, { prefix = "<leader>" })
		end,
	},
	-- {
	--   "mfussenegger/nvim-lint",
	--   lazy = true,
	--   event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	--   config = function()
	--     local lint = require("lint")
	--
	--     lint.linters_by_ft = {
	--       javascript = { "eslint_d" },
	--       typescript = { "eslint_d" },
	--       javascriptreact = { "eslint_d" },
	--       typescriptreact = { "eslint_d" },
	--       svelte = { "eslint_d" },
	--       python = { "pylint" },
	--     }
	--
	--     local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
	--
	--     vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	--       group = lint_augroup,
	--       callback = function()
	--         lint.try_lint()
	--       end,
	--     })
	--
	--     local wk = require("which-key")
	--     wk.register({
	--       d = {
	--         f = {
	--           function()
	--             lint.try_lint()
	--           end,
	--           "Lintting for current file",
	--         },
	--       },
	--     }, { prefix = "<leader>" })
	--   end,
	-- }
}
