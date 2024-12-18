return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {{
      "folke/lazydev.nvim",
      ft = "lua",  -- only load on lua files
      opts = {
	library = {
	  -- see the configuration section for more details
	  -- load luvit types when the vim.uv word is found
	  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
      },
    },  },
    config = function()
      require("lspconfig").lua_ls.setup {} -- Lua
    end,
  }
}
