{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.gnome.forge {
    home.packages = with pkgs; [
      gnomeExtensions.forge
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "forge@jmmaranan.com"
        ];
      };

      "org/gnome/shell/extensions/forge" = {
        tiling-mode-enabled = true;
        window-gap-hidden-on-single = true;
      };

    };
  };
}
