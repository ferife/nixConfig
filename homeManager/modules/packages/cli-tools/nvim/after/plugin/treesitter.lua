require('nvim-treesitter.configs').setup {
  ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp' }, -- Define languages and filetypes here

  auto_install = false,

  highlight = { enable = true },

  indent = { enable = true },
}

-- Run :TSInstall <language_name> to install new languages