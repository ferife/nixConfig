{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.hyprland.app-launcher == "wofi") {
      hm.hyprland.wofi = lib.mkForce true;
    })
    (lib.mkIf config.hm.hyprland.wofi {
      programs.wofi = {
        enable = true;
        # settings = {};
      };
    })
  ];
}
