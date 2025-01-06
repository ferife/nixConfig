return {
  {
    "tpope/vim-commentary",
    -- This plugin makes commenting a lot easier

    -- Type `gcc` in normal mode to comment out the current line
    -- If the line is already commented, this motion will uncomment it
    -- This motion can take a count. Typing `3gcc` will (un)comment the current line and the 2 that follow

    -- `gc` can also work as an operator for a motion (see Lessons 2.3 and 2.5 in nvim tutor)
    -- For example, `gcap` will comment out the current paragraph

    -- Type `gc` in visual mode to comment out the selection
  }
}
