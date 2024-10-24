{ config, pkgs, ... }:

{
  imports =
    [ 
      # Add general config options required for the computer to work
      ../../general-config.nix


      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ../../modules/auto-upgrade.nix

      # Application Modules
      ../../modules/packages/access-media.nix
      ../../modules/packages/cli-tools.nix
      ../../modules/packages/create-media.nix
      # ../../modules/packages/distrobox.nix
      ../../modules/packages/mullvad-vpn.nix
      ../../modules/packages/programming.nix
      ../../modules/packages/thunderbird.nix
      ../../modules/packages/tor.nix
    ];
}
