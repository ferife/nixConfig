{inputs, ...}: {
  flake.modules.nixos.gnome = {pkgs, ...}: {
    imports = [inputs.self.modules.nixos.gdm];

    services.desktopManager.gnome.enable = true;
  };

  # flake.modules.homeManager.gnome = {pkgs, ...}: {};
}
