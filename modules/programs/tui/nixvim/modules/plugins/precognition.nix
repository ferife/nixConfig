{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-precognition = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-precognition = {pkgs, ...}: {
    plugins.precognition.enable = true;
  };
}
