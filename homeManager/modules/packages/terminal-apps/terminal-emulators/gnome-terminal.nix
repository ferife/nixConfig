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

        profile.frfConfig = {
          default = true;
          visibleName = "Fernando's Terminal config";

          showScrollbar = false;
          font = "FiraCode Nerd Font 12";

          colors.backgroundColor = "blue";
        };
      };
    })
    (lib.mkIf (!config.hm.gnome-terminal) {
      programs.gnome-terminal.enable = false;
    })
  ];
}
