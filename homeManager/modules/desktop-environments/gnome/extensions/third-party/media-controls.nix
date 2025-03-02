{ config, lib, pkgs, ... }:
{
  options = {
    gnome.mediaControls.enable = lib.mkEnableOption "Installs & enables the Media Controls extension, which adds controls for audio to be controlled from the top bar";
  };

  config = lib.mkIf config.gnome.mediaControls.enable {
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
