{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.mediaControls {
    programs.gnome-shell.extensions = [
      {
        id = "mediacontrols@cliffniff.github.com";
        package = pkgs.gnomeExtensions.media-controls;
      }
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "mediacontrols@cliffniff.github.com"
        ];
      };
    };
  };
}
