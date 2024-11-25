

return {

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  'folke/neodev.nvim',

  -- Allows for auto commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
  
  -- Color Scheme
  {
    "ellisonleao/gruvbox.nvim"
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("lualine").setup({
        icons_enabled = true,
        theme = 'gruvbox',
      })
    end,
  },

  -- Code Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets', -- Snipett 

      'hrsh7th/cmp-nvim-lsp'
    },
  },

  -- Telescope
  {
    'nvim-telecope/telecope-fzf-native.nvim',
    build = 'make',
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  
}

-- Other cool plugins to install
-- gitsigns.nvim
  -- View git changes
-- Diffview.nvim
  -- Great git diff interface
-- Neo-tree.nvim
  -- For a more traditional file manager similar to VS Code