{inputs, ...}: {
  flake.modules.nixos.gdm = {pkgs, ...}: {
    services.displayManager.gdm.enable = true;

    environment.systemPackages = [pkgs.gdm-settings];
  };

  # flake.modules.homeManager.gdm = {pkgs, ...}: {};
}
