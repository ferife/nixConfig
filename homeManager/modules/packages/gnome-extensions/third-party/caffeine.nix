

{ config, lib, pkgs, ... }:
{

  options = {
    caffeineModule.enable = lib.mkEnableOption "Installs & enables the Caffeine extension, which allows the screen to stay on";
  };

  config = lib.mkIf config.caffeineModule.enable {
    home.packages = with pkgs; [
      gnomeExtensions.caffeine
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "caffeine@patapon.info"
        ];
      };
    };
  };
}