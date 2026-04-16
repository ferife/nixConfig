{inputs, ...}: {
  # vlc is a media player

  flake.modules.homeManager.vlc = {pkgs, ...}: {
    home.packages = [pkgs.vlc];
  };
}
