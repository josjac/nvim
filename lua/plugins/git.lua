return {
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local wk = require("which-key")
      wk.register({
        g = {
          name = "Git",
          l = { "<cmd>LazyGit<CR>", "Lazy git" },
        },
      }, { prefix = "<leader>" })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  }
}
