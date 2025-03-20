{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.workspaceIndicator {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
