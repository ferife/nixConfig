

{ config, lib, pkgs, ... }:
{

  options = {
    nativeWindowPlacementModule.enable = lib.mkEnableOption "Enables the Native Window Placement extension, which will lay out the thumbnails of the windows in a way that more accurately reflect their current positions on the screen";
  };

  config = lib.mkIf config.nativeWindowPlacementModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}