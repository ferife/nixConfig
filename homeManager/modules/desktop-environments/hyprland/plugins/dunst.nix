{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.dunst {
    services.dunst = {
      enable = true;

      settings = {
        global = {
          font = lib.mkForce "${userSettings.font} 12";
          dmenu = lib.mkIf config.hm.hyprland.rofi "rofi -dmenu";
        };
      };
    };

    home.packages = [
      pkgs.libnotify
      pkgs.pulseaudio # Allows access to the paplay command for sound notifications
      pkgs.ffmpeg # To use to configure sound files
    ];
  };
}
