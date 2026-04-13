{inputs, ...}: {
  # Audacity is an audio editor
  #
  # flake.modules.nixos.audacity = {pkgs, ...}: {};

  flake.modules.homeManager.audacity = {pkgs, ...}: {
    home.packages = [pkgs.audacity];
  };
}
