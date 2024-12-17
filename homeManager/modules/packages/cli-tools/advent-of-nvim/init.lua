-- This config was created in part by following the "Advent of Neovim" series of YouTibe videos by TJ DeVries

print("Welcome to FRF's Advent of NVim Configuration") -- This worked, it printed at the bottom of nvim

require("config.lazy")

-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- This is supposed to run the code in the current file
-- I don't know if it will work for all languages or just Lua
--
-- vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- vim.keymap.set("v", "<space>x", ":lua<CR>")
-- The two lines above work together to do the same as above, except it would execute the currently selected line(s)

-- Flash Highlights text when it gets yanked/copied
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})




