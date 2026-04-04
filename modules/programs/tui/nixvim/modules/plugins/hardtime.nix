{inputs, ...}: {
  # flake.modules.nixos.nixvim.nixvim-hardtime = {pkgs, ...}: {};

  flake.modules.homeManager.nixvim-hardtime = {pkgs, ...}: {
    plugins.hardtime.enable = true;
  };
}
