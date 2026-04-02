{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.hm.wm.components.dunst {
    services.dunst = {
      enable = true;

      settings = {
        global = {
          font = lib.mkForce "${config.hm.specialArgs.user-settings.font.name} 12";
          dmenu = lib.mkIf (config.hm.wm.app-launcher == "rofi") "rofi -dmenu";
        };
      };
    };

    # Use pw-play command to play audio from scripts

    home.packages = [
      pkgs.libnotify
      pkgs.ffmpeg # To use to configure sound files
    ];
  };
}
