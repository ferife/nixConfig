{inputs, ...}: {
  # Audacity is an audio editor

  flake.modules.homeManager.audacity = {pkgs, ...}: {
    home.packages = [pkgs.audacity];
  };
}
