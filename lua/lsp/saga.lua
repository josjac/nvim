return {
	"nvimdev/lspsaga.nvim",
	after = "nvim-lspconfig",
	config = function()
		require("lspsaga").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
