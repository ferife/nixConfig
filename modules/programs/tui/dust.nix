{inputs, ...}: {
  # dust is a disk usage utility
  #
  # flake.modules.nixos.dust = {pkgs, ...}: {};

  flake.modules.homeManager.dust = {pkgs, ...}: {
    home.packages = [pkgs.dust];
  };
}
