{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.clipboardIndicator {
    programs.gnome-shell.extensions = [
      {
        id = "clipboard-indicator@tudmotu.com";
        package = pkgs.gnomeExtensions.clipboard-indicator;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "clipboard-indicator@tudmotu.com"
        ];
      };
    };
  };
}
