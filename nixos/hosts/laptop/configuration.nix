{ config, lib, pkgs, ... }:

{
  imports = [ 
    # Add general config options required for the computer to work
    ../../general-config.nix


    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Settings Modules
    ../../modules/settings/module-bundle.nix

    # Application Modules
    ../../modules/packages/access-media/module-bundle.nix
    ../../modules/packages/browsers/module-bundle.nix
    ../../modules/packages/cli-tools/module-bundle.nix
    ../../modules/packages/create-media/module-bundle.nix
    ../../modules/packages/nix-related/module-bundle.nix
    ../../modules/packages/other/module-bundle.nix
  ];
  
  networking.hostName = "nixos";
  # Should match the name given in the NixOS configuration entrypoint in flake.nix

}
