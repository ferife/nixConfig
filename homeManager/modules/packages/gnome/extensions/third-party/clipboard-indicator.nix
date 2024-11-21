

{ config, lib, pkgs, ... }:
{

  options = {
    clipboardIndicatorModule.enable = lib.mkEnableOption "Installs & enables the Clipboard Indicator extension, which shows a menu with the recent history of the clipboard";
  };

  config = lib.mkIf config.clipboardIndicatorModule.enable {
    home.packages = with pkgs; [
      gnomeExtensions.clipboard-indicator
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "clipboard-indicator@tudmotu.com"
        ];
      };
    };
  };
}