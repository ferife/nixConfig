{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.hyprland.app-launcher == "rofi") {
      hm.hyprland.rofi = lib.mkForce true;
    })
    (lib.mkIf config.hm.hyprland.rofi {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland; # lbonn's fork of rofi, with added wayland support
        font = lib.mkForce "${config.hm.specialArgs.user-settings.font.name} 12";
        terminal = "${pkgs.ghostty}/bin/ghostty";
      };
    })
  ];
}
