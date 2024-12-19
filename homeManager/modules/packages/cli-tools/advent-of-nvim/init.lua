-- This config was created in part by following the "Advent of Neovim" series of YouTibe videos by TJ DeVries
-- TODO: Read :help ins-completion

print("Welcome to FRF's Advent of NVim Configuration") -- This worked, it printed at the bottom of nvim

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.scrolloff = 10
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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

-- LSPs communicate information about your code and the programming language to your code editor
