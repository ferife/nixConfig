{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-lsp = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-lsp = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      nixvim-bash
      nixvim-c
      nixvim-csv
      nixvim-lua
      nixvim-nix
    ];

    plugins = {
      lsp = {
        enable = true; # Enables github:neovim/nvim-lspconfig
        # inlayHints.enable = true; # Testing
        keymaps.lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };

      # plugins = {
      lsp-format.enable = true;

      treesitter = {
        enable = true;
        # folding = true;
        nixvimInjections = true; # Will color contents of extraConfigLua and other such injections as Lua
        # grammarPackages = [pkgs.tree-sitter-grammars.tree-sitter-comment];
      };
      dependencies = {
        curl.enable = true;
        tree-sitter.enable = true;
      };

      treesitter-context = {
        enable = true;
        settings.line_numbers = true;
      };
    };
  };
}
