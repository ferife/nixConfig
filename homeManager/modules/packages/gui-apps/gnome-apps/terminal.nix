{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf config.hm.gnome-terminal {
      programs.gnome-terminal = {
        enable = true;
        showMenubar = true;

        profile.cf2615ef-4917-4c62-a71c-2b875e0964cb = {
          default = true;
          visibleName = "FRF's terminal config";

          showScrollbar = false;
          font = "${config.hm.specialArgs.user-settings.font.name} 12";
        };
      };
    })
  ];
}
