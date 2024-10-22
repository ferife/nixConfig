{ config, pkgs, ... }:

{
  imports =
    [ 
      # Add general config options required for the computer to work
      ../../general-config.nix


      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../modules/autoupgrade.nix

      # Application Modules
      ../../modules/applications/accessMedia.nix
      ../../modules/applications/cliTools.nix
      ../../modules/applications/createMedia.nix
      # ../../modules/applications/distrobox.nix
      ../../modules/applications/mullvad-vpn.nix
      ../../modules/applications/requiredForProgramming.nix
      ../../modules/applications/thunderbird.nix
      ../../modules/applications/tor.nix
    ];
}
