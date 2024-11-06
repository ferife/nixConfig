

{ config, lib, pkgs, ... }:
{

  options = {
    forgeModule.enable = lib.mkEnableOption "Installs & enables the Forge extension, which allows for automatic window tiling";
  };

  config = lib.mkIf config.forgeModule.enable {
    home.packages = with pkgs; [
      gnomeExtensions.forge
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "forge@jmmaranan.com"
        ];
      };
    };
  };
}