return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", {})
    end
  },
  {
    "tpope/vim-fugitive"
  },
  {
    "NeogitOrg/neogit", -- Meant to be a modern replacement of vim fugitive
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim", -- Diff integration
      "nvim-telescope/telescope.nvim",
    },
    config = true
  },
}
