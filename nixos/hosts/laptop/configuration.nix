{ config, pkgs, ... }:

{
  imports =
    [ 
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
      ../../modules/packages/create-media.nix
      ../../modules/packages/mullvad-vpn.nix
      ../../modules/packages/programming.nix
      ../../modules/packages/thunderbird.nix
    ];
}
