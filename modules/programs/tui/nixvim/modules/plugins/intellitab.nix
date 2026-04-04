{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-intellitab = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-intellitab = {pkgs, ...}: {
    plugins.intellitab.enable = true;
  };
}
