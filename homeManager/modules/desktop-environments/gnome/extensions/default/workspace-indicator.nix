{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.workspaceIndicator {
    programs.gnome-shell.extensions = [
      {
        id = "workspace-indicator@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.workspace-indicator;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
