{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hm.gnome.caffeine {
    programs.gnome-shell.extensions = [
      {
        id = "caffeine@patapon.info";
        package = pkgs.gnomeExtensions.caffeine;
      }
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
