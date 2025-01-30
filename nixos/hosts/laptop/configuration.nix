{ config, lib, pkgs, ... }:

{
  imports = [ 
    # Add general config options required for the computer to work
    ../../general-config.nix


    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include all modules
    ../../modules
  ];
  
  networking.hostName = "nixos";
  # Should match the name given in the NixOS configuration entrypoint in flake.nix

  gaming.enable = lib.mkForce false; # Temporarily, as I finish the semester
}
