{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-csv = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-csv = {pkgs, ...}: {
    plugins.csvview.enable = true;
  };
}
