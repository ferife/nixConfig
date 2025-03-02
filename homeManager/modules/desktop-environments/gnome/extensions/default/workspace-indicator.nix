{ config, lib, ... }:
{
  options = {
    gnome.workspaceIndicator.enable = lib.mkEnableOption "Enables the Workspace Indicator extension, which adds a workspace switcher to the top bar";
  };

  config = lib.mkIf config.gnome.workspaceIndicator.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
