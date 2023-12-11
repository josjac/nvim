-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		local nvimtree = require("nvim-tree")
--
-- 		-- recommended settings from nvim-tree documentation
-- 		vim.g.loaded_netrw = 1
-- 		vim.g.loaded_netrwPlugin = 1
--
-- 		-- change color for arrows in tree to light blue
-- 		-- vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
-- 		-- vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])
--
-- 		-- configure nvim-tree
-- 		nvimtree.setup({
-- 			view = {
-- 				-- width = 35,
-- 				-- relativenumber = true,
-- 			},
-- 			-- change folder arrow icons
-- 			renderer = {
-- 				indent_markers = {
-- 					-- enable = true,
-- 				},
-- 				icons = {
-- 					-- glyphs = {},
-- 				},
-- 			},
-- 			-- disable window_picker for
-- 			-- explorer to work well with
-- 			-- window splits
-- 			actions = {
-- 				open_file = {
-- 					window_picker = {
-- 						-- enable = false,
-- 					},
-- 				},
-- 			},
-- 			filters = {
-- 				custom = { ".DS_Store" },
-- 			},
-- 			git = {
-- 				ignore = true,
-- 			},
-- 		})
--
-- 		-- set keymaps
-- 		local keymap = vim.keymap -- for conciseness
-- 		local wk = require("which-key")
--
-- 		wk.register({
-- 			e = {
-- 				name = "File explorer",
-- 				t = { "<cmd>NvimTreeToggle<CR>", "File explorer toggle" },
-- 				f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
-- 				c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
-- 				r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
-- 			},
-- 		}, { prefix = "<leader>" })
--
-- 		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer toggle" })
-- 	end,
-- }
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
				-- f = { "<cmd>NvimTreeFindFileToggle<CR>", "Toggle file explorer on current file" },
				-- c = { "<cmd>NvimTreeCollapse<CR>", "Collapse file explorer" },
				-- r = { "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer" },
			},
		}, { prefix = "<leader>" })

		keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "File explorer toggle" })
	end,
}
