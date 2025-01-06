-- When in Insert Mode while viewing the Telescope menu, pressing ctrl+/ will open up a guide for keymaps to navigate the telescope menu

return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
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

      vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files,
        { desc = "Fuzzy Search Files in Current Working Directory" })

      vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, { desc = "Fuzzy search the help" })

      -- The following will call a keymap to grep search the current working directory
      require "config.telescope.multigrep".setup()
    end
  }
}
