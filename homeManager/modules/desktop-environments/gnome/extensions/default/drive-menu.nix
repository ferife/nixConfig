{ config, lib, ... }:
{
  options = {
    gnome.driveMenu.enable = lib.mkEnableOption "Enables the Removable Drive Menu extension, which shows a status menu for rapid unmount and power off of external storage devices (i.e. USB drives)";
  };

  config = lib.mkIf config.gnome.driveMenu.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
