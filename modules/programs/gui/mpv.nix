{inputs, ...}: {
  # MPV is a media player
  #
  # flake.modules.nixos.mpv = {pkgs, ...}: {};

  flake.modules.homeManager.mpv = {pkgs, ...}: {
    programs.mpv.enable = true;
  };
}
