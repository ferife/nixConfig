return {
  {
    "folke/which-key.nvim",
    -- This plugin adds a guide at the bottom of the screen
    -- This guide pops up when beginning to type a command in normal or visual mode
    -- The guide shows the keymaps available given the current half-written command, describing those keymaps
    -- For custom keymaps to work, they need to be assigned a `desc` value
    -- Example: vim.keymap.set("n", "<leader>q", function() end, { desc = "Describe what the keymap does" })

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
    -- config = function()
    --   local wk = require("which-key")
    --   vim.keymap.set("n", "<leader>?", function() wk.show({ global = false }) end,
    --     { desc = "View guide to key mappings" })
    -- end
  }
}
