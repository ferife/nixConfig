{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}: {
  config = lib.mkIf config.nixos.gaming.openrazer {
    hardware.openrazer = {
      enable = true;
      users = [
        "${userSettings.username}"
      ];
    };

    environment.systemPackages = with pkgs; [
      openrazer-daemon # self-explanatory
      polychromatic # front-end for controlling Razer peripheral LEDs
    ];
  };
}
