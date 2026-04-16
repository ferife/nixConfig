{inputs, ...}: {
  # GDM is a login manager made to primarily work with GNOME

  flake.modules.nixos.gdm = {pkgs, ...}: {
    services.displayManager.gdm.enable = true;

    environment.systemPackages = [pkgs.gdm-settings];
  };
}
