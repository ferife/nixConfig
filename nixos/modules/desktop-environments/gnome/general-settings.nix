{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nixos.gnome.enable {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.gnome.gnome-browser-connector.enable = true; # Allows for GNOME extensions to affect browsers
  };
}
