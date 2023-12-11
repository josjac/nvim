return {
	"udalov/kotlin-vim",
	config = function()
		vim.cmd("let g:kotlin#indent=4")
		vim.cmd("autocmd FileType kotlin setlocal omnifunc=LanguageClient#complete")
	end,
}
