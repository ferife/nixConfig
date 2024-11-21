

{ config, lib, pkgs, ... }:
{

  options = {
    workspaceIndicatorModule.enable = lib.mkEnableOption "Enables the Workspace Indicator extension, which adds a workspace switcher to the top bar";
  };

  config = lib.mkIf config.workspaceIndicatorModule.enable {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}