return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  "christoomey/vim-tmux-navigator", -- tmux & split window navigation

  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-media-files.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate " },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            -- find command (defaults to `fd`)
            find_cmd = "rg",
          },
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("media_files")

      local wk = require("which-key")
      wk.register({
        f = {
          name = "Fuzzy find",
          f = { "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd" },
          r = { "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files" },
          s = { "<cmd>Telescope live_grep<cr>", "Find string in cwd" },
          c = { "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd" },
          b = { "<cmd>Telescope buffers<CR>", "Find buffer" },
        },
      }, { prefix = "<leader>" })
    end,
  }
}

