

{ config, lib, pkgs, ... }:
{
  options = {
    hmGnomeModule.enable = lib.mkEnableOption "Installs & configures certain extensions and settings for the GNOME desktop environment";
  };

  # config = lib.mkIf config.hmGnomeModule.enable {
    imports = [
      ./extensions/module-bundle.nix
      ./settings/module-bundle.nix
    ];
  # };
}
