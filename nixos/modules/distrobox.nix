

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    distrobox # Program that allows adding programs from outside the nixpkgs environment
    podman    # Dev tool (required by distrobox)
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}