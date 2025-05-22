{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.tilingShell {
    programs.gnome-shell.extensions = [
      {
        id = "tilingshell@ferrarodomenico.com";
        package = pkgs.gnomeExtensions.tiling-shell;
      }
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
