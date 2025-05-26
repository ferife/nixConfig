{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      hyprcursor.enable = lib.mkIf config.hm.hyprland.enable true;
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
    };
  };
}
