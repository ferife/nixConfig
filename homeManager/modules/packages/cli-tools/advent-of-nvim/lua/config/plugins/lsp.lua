-- To add an LSP, simply type the following line into the code
-- require("lspconfig").LSP_NAME.setup { capabilities = capabilities }

-- To find the LSP for a specific language, type :help lspconfig-all
-- or go to the repository for nvim-lspconfig

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
      -- Auto Completion
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require("lspconfig").java_language_server.setup { capabilities = capabilities } -- Java
      require("lspconfig").lua_ls.setup { capabilities = capabilities }               -- Lua
      require("lspconfig").nixd.setup { capabilities = capabilities }                 -- Nix

      -- The following will auto-format the file I'm working on every time I press the keys written below
      vim.keymap.set("n", "<space>fo", function() vim.lsp.buf.format() end, { desc = "Auto format the current file" })

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
