{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-binds = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-binds = {pkgs, ...}: {
    imports = with inputs.self.modules.homeManager; [
      nixvim-binds-basic
    ];
  };
}
