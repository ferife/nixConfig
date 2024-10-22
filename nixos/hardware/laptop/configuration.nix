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
      ../../modules/packages/accessMedia.nix
      ../../modules/packages/cliTools.nix
      ../../modules/packages/createMedia.nix
      # ../../modules/packages/distrobox.nix
      ../../modules/packages/mullvad-vpn.nix
      ../../modules/packages/requiredForProgramming.nix
      ../../modules/packages/thunderbird.nix
      ../../modules/packages/tor.nix
    ];
}
