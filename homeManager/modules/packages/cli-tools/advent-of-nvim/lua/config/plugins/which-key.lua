return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- Configuration goes here
    },
    -- keys = {
    --   "<leader>?",
    --   function()
    --     require("which-key").show({ global = false })
    --   end,
    --   desc = "Buffer Local Keymaps (which-key)",
    -- },
    config = function()
      local wk = require("which-key")
      vim.keymap.set("n", "<leader>?", function() wk.show({ global = false }) end,
        { desc = "View guide to key mappings" })
    end
  }
}
