

{ config, lib, pkgs, ... }:
{

  options = {
    driveMenuModule.enable = lib.mkEnableOption "Enables the Removable Drive Menu extension, which shows a status menu for rapid unmount and power off of external storage devices (i.e. USB drives)";
  };

  config = lib.mkIf config.driveMenuModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}