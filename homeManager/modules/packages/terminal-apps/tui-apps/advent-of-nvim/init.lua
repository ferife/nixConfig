-- This config was created in part by following the "Advent of Neovim" series of YouTibe videos by TJ DeVries
-- TODO: Read :help ins-completion

print("Welcome to FRF's Advent of NVim Configuration")

vim.opt.number = true         -- Turn on line numbers
vim.opt.relativenumber = true -- Make line numbers relative
vim.opt.linebreak = true      -- Allows for word wrap to break lines at any character contained inside of the `breakat` string
-- By default, this is <space>I!@*-+;:,./?

vim.opt.shiftwidth = 2 -- Makes indent width equal to 2 spaces
vim.opt.scrolloff = 10 -- When moving up or down, makes cursor stay min 10 lines from top/bottom of window

vim.opt.clipboard = "unnamedplus"

-- The following 4 lines disable the arrow keys when in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>', { desc = "Disable movement with arrow keys" })
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>', { desc = "Disable movement with arrow keys" })
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>', { desc = "Disable movement with arrow keys" })
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>', { desc = "Disable movement with arrow keys" })
vim.opt.mouse = "" -- Disable Mouse


require("config.lazy") -- Allows plugins. Disable for a plugin-free experience

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

-- Deactivates line numbers for terminal windows
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)

  -- job_id = vim.bo.channel
end, { desc = "Puts a small terminal window at the bottom of the screen" })

-- Creates a keymap for staging all git changes
-- vim.keymap.set("n", "<space>gita", function()
--   vim.fn.chansend(job_id, {"git add .\r\n"})
-- end)

-- Keymap for escaping out of terminal mode
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Easily escape terminal mode" })

-- LSPs communicate information about your code and the programming language to your code editor
