{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.statusIcons {
    programs.gnome-shell.extensions = [
      {
        id = "status-icons@gnome-shell-extensions.gcampax.github.com";
        package = pkgs.gnomeExtensions.status-icons;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "status-icons@gnome-shell-extensions.gcampax.github.com"
        ];
      };
    };
  };
  # It specifically shows XEmbed status icons
  # Currently, the only application that shows an icon is Mullvad VPN
}
