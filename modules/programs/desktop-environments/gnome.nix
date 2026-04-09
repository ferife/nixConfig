{inputs, ...}: {
  # GNOME is a desktop environment

  flake.modules.nixos.gnome = {pkgs, ...}: {
    services = {
      desktopManager.gnome.enable = true;
      gnome.gnome-browser-connector.enable = true; # Allows for GNOME extensions to affect browsers
    };
  };

  # flake.modules.homeManager.gnome = {pkgs, ...}: {};
}
