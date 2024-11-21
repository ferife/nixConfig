

{ config, lib, pkgs, ... }:
{

  options = {
    userThemeModule.enable = lib.mkEnableOption "Enables the User Themes extension, which loads a shell theme from XDG_DATA_HOME/themes/<name>/gnome-shell";
  };

  config = lib.mkIf config.userThemeModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}