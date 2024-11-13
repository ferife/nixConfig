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

  gimpModule.enable = lib.mkForce false;
  libreofficeModule.enable = lib.mkForce false;
  obsStudioModule.enable = lib.mkForce false;
  qbittorrentModule.enable = lib.mkForce false;
  thunderbirdModule.enable = lib.mkForce false;
  torBrowserModule.enable = lib.mkForce false;
  vlcModule.enable = lib.mkForce false;
}
