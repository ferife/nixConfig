

{ config, lib, pkgs, ... }:
{

  options = {
    tilingShellModule.enable = lib.mkEnableOption "Installs & enables the Tiling Shell extension, which allows for automatic window tiling";
  };

  config = lib.mkIf config.tilingShellModule.enable {
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