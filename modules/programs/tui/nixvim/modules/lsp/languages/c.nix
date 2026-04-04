{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-c = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-c = {pkgs, ...}: {
    plugins.lsp.servers = {
      # asm_lsp.enable = true; # For assembly
      clangd.enable = true;
    };
  };
}
