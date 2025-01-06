return {
  {
    'echasnovski/mini.nvim',
    -- Library of 40+ independent Lua modules making small QoL changes to Neovim

    config = function()
      -- The following adds a pretty status line at the bottom of the window containing various important pieces of information
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
    end
  }
}
