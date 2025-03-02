{ config, lib, ... }:
{
  options = {
    gnome.autoMoveWindows.enable = lib.mkEnableOption "Enables the Auto Move Windows extension, which lets you assign each application a default workspace to open its windows in";
  };

  config = lib.mkIf config.gnome.autoMoveWindows.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
