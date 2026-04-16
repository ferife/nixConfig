{inputs, ...}: {
  # dust is a disk usage utility

  flake.modules.homeManager.dust = {pkgs, ...}: {
    home.packages = [pkgs.dust];
  };
}
