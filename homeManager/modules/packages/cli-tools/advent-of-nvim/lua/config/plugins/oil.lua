return {
  {
    'stevearc/oil.nvim',
    -- File explorer that allows for editing the filesystem like a normal Neovim buffer
    -- Type :e <filepath> to open Oil unto that filepath
    -- When the cursor is hovering over a directory, Use <CR> to navigate to that directory
    -- Use `-` to go up to the parent of the current directory

    --@module 'oil'
    --@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  }
}
