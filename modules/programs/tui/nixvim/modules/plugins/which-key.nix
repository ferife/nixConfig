{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-which-key = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-which-key = {pkgs, ...}: {
    plugins.which-key.enable = true;
  };
}
