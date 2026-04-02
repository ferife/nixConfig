{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.launchNewInstance {
    programs.gnome-shell.extensions = [
      {
        id = "launch-new-instance@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.launch-new-instance;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
}
