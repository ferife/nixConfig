{inputs, ...}: {
  # Openshot is a video editor

  flake.modules.homeManager.openshot = {pkgs, ...}: {
    home.packages = [pkgs.openshot-qt];
  };
}
