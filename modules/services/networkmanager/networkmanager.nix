{inputs, ...}: {
  flake.modules.nixos.networkmanager = {pkgs, ...}: {
    networking.networkmanager.enable = true;
  };

  # flake.modules.homeManager.networkmanager = {pkgs, ...}: {};
}
