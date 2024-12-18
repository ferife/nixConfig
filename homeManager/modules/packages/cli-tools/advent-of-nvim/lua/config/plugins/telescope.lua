return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  } },
  config = function()
    -- The following keymap will use telescope to fuzzy find files in the current working directory
    vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)
  end
}
