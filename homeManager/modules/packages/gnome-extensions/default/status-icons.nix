

{ config, lib, pkgs, ... }:
{

  options = {
    statusIconsModule.enable = lib.mkEnableOption "Enables the Status Icons extension, which shows special status icons in the top bar for certain applications";
    # It specifically shows XEmbed status icons
    # Currently, the only application that shows an icon is Mullvad VPN
  };

  config = lib.mkIf config.statusIconsModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "status-icons@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}