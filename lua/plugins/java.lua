return {
	"mfussenegger/nvim-jdtls",
	config = function()
		vim.cmd("au FileType java lua require'jdtls.setup'.add_commands()")
		vim.cmd("autocmd FileType java setlocal omnifunc=LanguageClient#complete")
	end,
}
