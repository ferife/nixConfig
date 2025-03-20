{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hm.gnome.launchNewInstance {
    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
