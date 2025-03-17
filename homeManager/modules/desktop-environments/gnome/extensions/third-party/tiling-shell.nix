{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.hm.gnome.tilingShell {
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
