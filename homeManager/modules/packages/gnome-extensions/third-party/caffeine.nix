

{ config, lib, pkgs, ... }:
{

  options = {
    caffeineModule.enable = lib.mkEnableOption "Installs & enables the Caffeine extension, which allows the screen to stay on";
    # caffeineModule.activate = lib.mkEnableOption "Causes Caffeine to activate on startup with no timer";
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

      # "org/gnome/shell/extensions/caffeine" = {
      #   toggle-state = lib.mkIf config.caffeineModule.activate true;
      # };
    };
  };
}