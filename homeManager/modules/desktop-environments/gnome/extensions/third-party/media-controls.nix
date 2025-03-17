{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.gnome.mediaControls {
    home.packages = with pkgs; [
      gnomeExtensions.media-controls
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "mediacontrols@cliffniff.github.com"
        ];
      };
    };
  };
}
