local lspconfig = require("lspconfig")
local capabilities = require('blink.cmp').get_lsp_capabilities()

lspconfig.java_language_server.setup({ capabilities = capabilities })
lspconfig.lua_ls.setup({ capabilities = capabilities })

-- The following sets up nixd LSP to show my custom options from my system flake, as well as the options from any of my imports, such as stylix
lspconfig.nixd.setup({
  capabilities = capabilities,
  cmd = { "nixd" },
  settings = {
    nixd = {
      -- nixpkgs = {
      -- expr = "import <nixpkgs> { }",
      -- },
      formatting = {
        command = { "alejandra" },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "~/Documents/Configs/nixConfig").nixosConfigurations.laptop.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "~/Documents/Configs/nixConfig").homeConfigurations.fernandorf@laptop.options',
          -- expr = '(builtins.getFlake "~/Documents/Configs/nixConfig").homeManagerConfigurations.fernandorf@laptop.options',
        },
      },
    },
  },
})

-- Set up folke/lazydev.nvim

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
