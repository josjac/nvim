return {
	"akinsho/flutter-tools.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({})
	end,
}
