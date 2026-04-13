{inputs, ...}: {
  # vlc is a media player
  #
  # flake.modules.nixos.vlc = {pkgs, ...}: {};

  flake.modules.homeManager.vlc = {pkgs, ...}: {
    home.packages = [pkgs.vlc];
  };
}
