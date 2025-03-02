{ config, lib, ... }:
{
  options = {
    gnome.windowsNavigator.enable = lib.mkEnableOption "Enables the Window Navigator extension, which lets you use the keyboard to select windows and workspaces in overlay mode";
  };

  config = lib.mkIf config.gnome.windowsNavigator.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
