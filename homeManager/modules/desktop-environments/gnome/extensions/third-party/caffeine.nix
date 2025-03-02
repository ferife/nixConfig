{ config, lib, pkgs, ... }:
{
  options = {
    gnome.caffeine.enable = lib.mkEnableOption "Installs & enables the Caffeine extension, which allows the screen to stay on";
  };

  config = lib.mkIf config.gnome.caffeine.enable {
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
