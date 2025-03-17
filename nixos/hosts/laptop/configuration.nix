{ config, lib, pkgs, systemSettings, ... }:
{
  imports = [
    # Add general config options required for the computer to work
    ../../general-config.nix

    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include all modules
    ../../modules
  ];

  networking.hostName = systemSettings.hostname1;
  # Should match the name given in the NixOS configuration entrypoint in flake.nix

  nixos.gaming.enable = lib.mkForce false; # Temporarily, as I finish the semester
}
