{ config, lib, pkgs, ... }:
{
  options = {
    gnome.tilingShell.enable = lib.mkEnableOption "Installs & enables the Tiling Shell extension, which allows for automatic window tiling";
  };

  config = lib.mkIf config.gnome.tilingShell.enable {
    home.packages = with pkgs; [
      gnomeExtensions.tiling-shell
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "tilingshell@ferrarodomenico.com"
        ];
      };
    };
  };
}
