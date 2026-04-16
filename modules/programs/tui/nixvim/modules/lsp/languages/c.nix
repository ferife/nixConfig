{inputs, ...}: {
  flake.modules.homeManager.nixvim-c = {pkgs, ...}: {
    plugins.lsp.servers = {
      # asm_lsp.enable = true; # For assembly
      clangd.enable = true;
    };
  };
}
