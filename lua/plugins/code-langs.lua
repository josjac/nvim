return {
	"dart-lang/dart-vim-plugin",
	"chooh/brightscript.vim",
	"akinsho/flutter-tools.nvim",
	"mfussenegger/nvim-jdtls",
	"udalov/kotlin-vim",
	requires = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({})
		vim.cmd("au FileType java lua require'jdtls.setup'.add_commands()")
		vim.cmd("autocmd FileType java setlocal omnifunc=LanguageClient#complete")
		vim.cmd("let g:kotlin#indent=4")
		vim.cmd("autocmd FileType kotlin setlocal omnifunc=LanguageClient#complete")
	end,
}

