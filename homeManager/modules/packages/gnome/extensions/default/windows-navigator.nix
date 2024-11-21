

{ config, lib, pkgs, ... }:
{

  options = {
    windowsNavigatorModule.enable = lib.mkEnableOption "Enables the Window Navigator extension, which lets you use the keyboard to select windows and workspaces in overlay mode";
  };

  config = lib.mkIf config.windowsNavigatorModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}