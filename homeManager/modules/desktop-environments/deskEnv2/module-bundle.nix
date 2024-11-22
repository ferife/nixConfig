

{ config, lib, pkgs, ... }:
{
  options = {
    hmDESKENV2Module.enable = lib.mkEnableOption "Installs & configures certain extensions and settings for the DESKENV2 desktop environment";
  };

  # config = lib.mkIf config.hmDESKENV2Module.enable {
    imports = [
      # Insert Module Bundles Here
    ];
  # };
}