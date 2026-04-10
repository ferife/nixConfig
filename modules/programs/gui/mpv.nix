{inputs, ...}: {
  # MPV is a media player
  #
  # flake.modules.nixos.mpv = {pkgs, ...}: {};

  flake.modules.homeManager.mpv = {pkgs, ...}: {
    services.playerctld.enable = true;

    programs.mpv = {
      enable = true;
      scripts = [pkgs.mpvScripts.mpris]; # Allows playerctl to detect & control mpv
    };
  };
}
