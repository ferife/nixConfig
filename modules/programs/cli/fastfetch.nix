{inputs, ...}: {
  # flake.modules.nixos.fastfetch = {pkgs, ...}: {};

  flake.modules.homeManager.fastfetch = {pkgs, ...}: {
    programs.fastfetch.enable = true;
  };
}
