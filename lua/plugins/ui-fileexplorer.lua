return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		local keymap = vim.keymap -- for conciseness
		local wk = require("which-key")
		wk.register({
			e = {
				name = "File explorer",
				t = { "<cmd>Neotree toggle<CR>", "File explorer toggle" },
				r = { "<cmd>Neotree reveal<CR>", "Reveal current file in file explorer" },
				b = { "<cmd>Neotree buffers<CR>", "List open buffers in file explorer" },
			},
		}, { prefix = "<leader>" })

		keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "File explorer toggle" })
	end,
}
