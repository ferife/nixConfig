{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-ufo = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-ufo = {pkgs, ...}: {
    # Handles folding
    plugins.nvim-ufo.enable = true;
  };
}
