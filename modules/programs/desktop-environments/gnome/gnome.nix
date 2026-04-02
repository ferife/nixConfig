{inputs, ...}: {
  flake.modules.nixos.gnome = {pkgs, ...}: {
    # imports = [inputs.self.modules.nixos.gdm];

    services = {
      desktopManager.gnome.enable = true;
      gnome.gnome-browser-connector.enable = true; # Allows for GNOME extensions to affect browsers
    };
  };

  # flake.modules.homeManager.gnome = {pkgs, ...}: {};
}
