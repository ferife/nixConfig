{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-modules = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-modules = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      nixvim-appearance
      nixvim-binds
      nixvim-general
      nixvim-lsp
      nixvim-plugins
    ];
  };
}
