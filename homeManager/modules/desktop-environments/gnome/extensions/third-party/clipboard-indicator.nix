{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.gnome.clipboardIndicator {
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
