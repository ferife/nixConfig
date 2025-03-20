{
  config,
  lib,
  ...
}: {
  options.nixos = {
    androidStudio = lib.mkEnableOption "Android Studio, an IDE designed by Google specifically to create Android applications";
    gaming.enable = lib.mkEnableOption "All the gaming-related packages and options";
    mullvadVpn = lib.mkEnableOption "Mullvad VPN, including both a CLI and a GUI";
    vlc = {
      enable = lib.mkEnableOption "VLC, a media player";
      replaceGnomeDefault = lib.mkOption {
        type = with lib.types; bool;
        default = false;
        description = "Replaces Gnome Music and Totem, the default GNOME audio and video players respectively";
        example = true;
      };
    };
  };
}
