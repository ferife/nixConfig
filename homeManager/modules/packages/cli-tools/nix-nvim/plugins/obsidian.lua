local obsidian = require('obsidian')

obsidian.setup({
  workspaces = {
    {
      name = "Main Vault",
      path = "~/Documents/obsidian-vault",
    },
  },
  daily_notes = {
    folder = "RemoteVault/DailyNotes",
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links
    ["gf"] = {
      action = function()
        return obsidian.util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },

    -- Toggle checkboxes
    ["<leader>ch"] = {
      action = function()
        return obsidian.util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },

    -- Smart action depending on context
    -- Either follow link or toggle checkbox
    ["<cr>"] = {
      action = function()
        return obsidian.util.smart_action()
      end,
      opts = { buffer = true, expr = true },
    },
  },

})
