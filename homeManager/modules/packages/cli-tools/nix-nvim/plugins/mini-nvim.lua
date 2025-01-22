-- The following can be used to traverse and manipulate the filesystem
require('mini.files').setup({
  mappings = {
    close       = 'q',
    go_in       = 'l',
    go_in_plus  = 'L',
    go_out      = 'h',
    go_out_plus = 'H',
    mark_goto   = "'",
    mark_set    = 'm',
    reset       = '<BS>',
    reveal_cwd  = '@',
    show_help   = 'g?',
    synchronize = '=',
    trim_left   = '<',
    trim_right  = '>',
  },
  options = {
    -- Whether to delete permanently or move into module-specific trash
    permanent_delete = true,
    -- Whether to use for editing directories
    use_as_default_explorer = true,
  },
})

-- The following adds an animated vertical line that indicates scope, based on the number of indents
require('mini.indentscope').setup()

-- The following adds the ability to easily move text up or down, without having to cut and paste it
-- It also allows for moving left and right, meaning to add/remove indents
require('mini.move').setup({
  mappings = {
    -- Move visual selection in normal mode
    -- Default (shown below) are Alt (Meta) + hjkl
    left = '<M-h>',
    down = '<M-j>',
    up = '<M-k>',
    right = '<M-l>',

    -- Move current line in normal mode
    -- Default (shown below) are Alt (Meta) + hjkl
    line_left = '<M-h>',
    line_down = '<M-j>',
    line_up = '<M-k>',
    line_right = '<M-l>',
  }
})

-- The following will autoclose parentheses, braces, brackets, single-quotes, double-quotes, and backticks (`)
-- When creating a newline from between the opening and closing symbols,
-- it will automatically newline again for the closing symbol
require('mini.pairs').setup()

-- The following adds the ability to toggle whether the of a table/array/dictionary are all on the same line
-- or if they each have their own line
-- Use `gS` to toggle
require('mini.splitjoin').setup({
  mappings = {
    toggle = 'gS',
    -- split = '',
    -- join = '',
  },
})

-- The following adds a pretty status line at the bottom of the window containing various important pieces of information
require('mini.statusline').setup({ use_icons = true })
