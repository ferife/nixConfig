{ config, lib, ... }:
{
  options = {
    gnome.userTheme.enable = lib.mkEnableOption "Enables the User Themes extension, which loads a shell theme from XDG_DATA_HOME/themes/<name>/gnome-shell";
  };

  config = lib.mkIf config.gnome.userTheme.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
