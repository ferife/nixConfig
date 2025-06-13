{
  config,
  lib,
  pkgs,
  inputs,
  userSettings,
  ...
}: {
  config = lib.mkIf config.hm.hyprland.rofi {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland; # lbonn's fork of rofi, with added wayland support
      font = lib.mkForce "${userSettings.font} 12";
      terminal = "${pkgs.ghostty}/bin/ghostty";
    };
  };
}
