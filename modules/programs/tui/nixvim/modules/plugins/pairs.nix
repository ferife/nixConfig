{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-pairs = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-pairs = {pkgs, ...}: {
    plugins.mini-pairs.enable = true;
  };
}
