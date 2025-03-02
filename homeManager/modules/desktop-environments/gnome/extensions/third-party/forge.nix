{ config, lib, pkgs, ... }:
{
  options = {
    gnome.forge.enable = lib.mkEnableOption "Installs & enables the Forge extension, which allows for automatic window tiling";
  };

  config = lib.mkIf config.gnome.forge.enable {
    home.packages = with pkgs; [
      gnomeExtensions.forge
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "forge@jmmaranan.com"
        ];
      };

      "org/gnome/shell/extensions/forge" = {
        tiling-mode-enabled = true;
        window-gap-hidden-on-single = true;
      };

    };
  };
}
