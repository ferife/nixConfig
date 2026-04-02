{inputs, ...}: {
  flake.modules.nixos.gnome = {pkgs, ...}: {
    services.desktopManager.gnome.enable = true;
    services.displayManager.gdm.enable = true;
  };

  # flake.modules.homeManager.gnome = {pkgs, ...}: {};
}
