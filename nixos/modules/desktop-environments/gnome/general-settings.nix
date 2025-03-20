{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.gnome.enable {
    services.gnome.gnome-browser-connector.enable = true; # Allows for GNOME extensions to affect browsers
  };
}
