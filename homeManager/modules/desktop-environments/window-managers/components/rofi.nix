{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkMerge [
    (lib.mkIf (config.hm.wm.app-launcher == "rofi") {
      hm.wm.components.rofi = lib.mkForce true;
    })
    (lib.mkIf config.hm.wm.components.rofi {
      programs.rofi = {
        enable = true;
        font = lib.mkForce "${config.hm.specialArgs.user-settings.font.name} 12";
        terminal = "${pkgs.ghostty}/bin/ghostty";
      };
    })
    (lib.mkIf (config.hm.wm.components.rofi && (config.hm.specialArgs.system-settings.nixpkgs == "25.05")) {
      programs.rofi.package = pkgs.rofi-wayland;
    })
  ];
}
