require('telescope').setup {
  pickers = {
    find_files = {
      theme = "ivy",
      hidden = true,
    }
  },
  extensions = {
    fzf = {}
  }
}

require('telescope').load_extension('fzf')

vim.keymap.set('n', '<Leader>fd', require('telescope.builtin').find_files,
  { desc = "Fuzzy search the current working directory" })
