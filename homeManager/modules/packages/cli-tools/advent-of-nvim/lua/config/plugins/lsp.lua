return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- see the configuration section for more details
          -- load luvit types when the vim.uv word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    }, },
    config = function()
      require("lspconfig").lua_ls.setup {} -- Lua
      require("lspconfig").nixd.setup {}   -- Nix

      -- The following will auto-format the file I'm working on every time I press the keys written below
      vim.keymap.set("n", "<space>fo", function() vim.lsp.buf.format() end)

      -- The following will auto-format the file every time I write/save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
